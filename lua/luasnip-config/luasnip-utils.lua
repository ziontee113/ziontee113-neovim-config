---@diagnostic disable: undefined-global
local M = {}
local ls = require("luasnip")
local ts_utils = require("nvim-treesitter.ts_utils")
local augroup = vim.api.nvim_create_augroup("Custom Luasnip", { clear = true })

local i = ls.insert_node
local c = ls.choice_node
local d = ls.dynamic_node
local sn = ls.snippet_node

function M.create_snippet(opts)
	local snippet = ls.s(opts.trigger, opts.nodes, opts.opts)

	if opts.keymaps then
		for _, keymap in ipairs(opts.keymaps) do
			if not opts.pattern or not opts.keymaps then
				return
			end

			if type(keymap) == "string" then
				keymap = { "i", keymap }
			end

			vim.api.nvim_create_autocmd("BufEnter", {
				pattern = opts.pattern,
				group = augroup,
				callback = function()
					vim.keymap.set(keymap[1], keymap[2], function()
						ls.snip_expand(snippet)
					end, { silent = true, buffer = true })
				end,
			})
		end
	end

	table.insert(opts.target_table, snippet)
end

function M.get_top_node()
	local node = ts_utils.get_node_at_cursor()
	local root = ts_utils.get_root_for_node(node)
	local parent = node:parent()

	while parent ~= nil and parent ~= root do
		node = parent
		parent = node:parent()
	end
	return node
end

local function filter_str_len_larger_than(tbl, str_len)
	local return_tbl = {}
	for _, v in ipairs(tbl) do
		if #v > str_len then
			table.insert(return_tbl, v)
		end
	end
	return return_tbl
end

local function filter_unique(tbl)
	local hashmap, return_tbl = {}, {}
	for _, v in ipairs(tbl) do
		if not hashmap[v] then
			hashmap[v] = i
			table.insert(return_tbl, v)
		end
	end

	return return_tbl
end

local function get_identifers_text_tbl(opts)
	local top_node = M.get_top_node()
	local query = opts.query or "((identifier) @capture)"
	local iter_query = vim.treesitter.query.parse_query(opts.ft or vim.bo[0].ft, query)

	local node_text_tbl = {}
	for _, matches, _ in iter_query:iter_matches(top_node, 0) do
		local node = matches[1]
		local node_text = vim.treesitter.query.get_node_text(node, 0)
		table.insert(node_text_tbl, node_text)
	end

	return node_text_tbl
end

M.tn = function(jump_index, opts)
	return d(jump_index, function()
		local node_text_tbl = get_identifers_text_tbl(opts)
		local filtered_node_text_tbl = filter_unique(node_text_tbl)
		filtered_node_text_tbl = filter_str_len_larger_than(node_text_tbl, 1)

		local choices_tbl = {}
		for _, v in ipairs(filtered_node_text_tbl) do
			table.insert(choices_tbl, i(1, v))
		end

		return sn(nil, {
			c(1, choices_tbl),
		})
	end, {})
end

return M
-- {{{nvim-execute-on-save}}}
