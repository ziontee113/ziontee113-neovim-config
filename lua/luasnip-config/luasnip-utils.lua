local M = {}
local ls = require("luasnip")
local augroup = vim.api.nvim_create_augroup("Custom Luasnip", { clear = true })

function M.create_snippet(opts)
	local snippet = ls.s(opts.trigger, opts.nodes)

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

return M
