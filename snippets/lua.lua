---@diagnostic disable: undefined-global

---@diagnostic disable-next-line: unused-local
local snippets, autosnippets, cs = {}, {}, require("luasnip-config.luasnip-utils").create_snippet

-- TODO: trigger last triggerred snippet
-- TODO: use Neo-Minimap to quickly view the keymaps for snippets

-- Variable Declaration
cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
local {} = {}
]=],
		{
			i(1, ""),
			i(2, ""),
		}
	),
	target_table = snippets,
	pattern = { "*.lua" },
	keymaps = { "<C-J><C-L>", "<C-L><C-L>" },
})

-- <C-?> shortcut
cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
<C-{}>
]=],
		{
			i(1, ""),
		}
	),
	target_table = snippets,
	pattern = { "*.lua" },
	keymaps = { "<C-L><C-C>" },
})

-- Augroup
cs({
	trigger = "augroup",
	nodes = fmt(
		[=[
local {} = vim.api.nvim_create_augroup("{}")
]=],
		{
			i(1, "augroup"),
			i(2, "Augroup Name"),
		}
	),
	target_table = snippets,
	pattern = { "*.lua" },
	keymaps = { "<C-J>au" },
})

-- Autocmd
cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
vim.api.nvim_create_autocmd({{ "{}" }}, {{
	pattern = "{}",
	group = {},
	callback = function()
        {}
	end,
}})
]=],
		{
			i(1, "Event"),
			i(2, "*"),
			i(3, "augroup"),
			i(4, "-- TODO:"),
		}
	),
	target_table = snippets,
	pattern = { "*.lua" },
	keymaps = { "<C-J>ac" },
})

-- Execute On Save
cs({
	trigger = "onsave",
	nodes = fmt(
		[=[
-- {{{nvim-execute-on-save}}}
]=],
		{},
		{ delimiters = "<>" }
	),
	target_table = snippets,
	pattern = { "*/.config/*.lua" },
	keymaps = { "<C-j><C-o><C-s>" },
})

-- N() for Notify
cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
N({})
]=],
		{
			c(1, { fmt([["{}"]], i(1, "")), i(1, "") }),
		}
	),
	target_table = snippets,
	pattern = { "*/.config/*.lua" },
	keymaps = { "<C-j><C-n>" },
})

-- vim.api.nvim_buf_clear_namespace
cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
vim.api.nvim_clear_namespace({}, {}, {}, {})
]=],
		{
			i(1, "0"),
			i(2, "ns"),
			i(3, "0"),
			i(4, "-1"),
		}
	),
	target_table = snippets,
	pattern = { "*.lua" },
	keymaps = { "<C-k>ns" },
})

-- vim.api.nvim_create_namespace
cs({
	trigger = "namespace",
	nodes = fmt(
		[=[
local {} = vim.api.nvim_create_namespace("{}")
]=],
		{
			i(1, "ns"),
			i(2, "namespace_name"),
		}
	),
	target_table = snippets,
	pattern = { "*.lua" },
	keymaps = { "<C-j>ns" },
})

-- vim.keymap.set
cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
vim.keymap.set("{}", "{}", {}, {{{}}})
]=],
		{
			c(1, { i(1, "n"), i(1, "x") }),
			i(2, "keymap"),
			c(3, { fmt(
				[[
function()
    {}
end
            ]],
				i(1, "")
			), fmt([["{}"]], i(1, "")) }),
			i(4, ""),
		}
	),
	target_table = snippets,
	pattern = { "*.lua" },
	keymaps = { "<C-k><C-s>" },
})

-- vim.api
cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
{}
]=],
		{
			c(1, {
				t("vim.api."),
				fmt([[vim.api.nvim_buf_{}({})]], { i(1, ""), i(2, "") }),
				fmt([[vim.api.nvim_win_{}({})]], { i(1, ""), i(2, "") }),
			}),
		}
	),
	target_table = snippets,
	pattern = { "*.lua" },
	keymaps = { "<C-j><C-a>" },
})

-- ==== LuaSnip ==== --

-- LuaSnip Snippet Node
cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
sn({}, {{{}}})
]=],
		{
			i(1, "1"),
			i(2, ""),
		}
	),
	target_table = snippets,
	pattern = { "*/snippets/*.lua" },
	keymaps = { "<C-K>sn" },
})

-- LuaSnip Insert Node
cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
i(1, "{}"),
]=],
		{
			i(1, ""),
		}
	),
	target_table = snippets,
	pattern = { "*/snippets/*.lua" },
	keymaps = { "<C-j><C-k>" },
})

-- LuaSnip Choice Node
cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
c({}, {{ {} }}),
]=],
		{
			i(1, ""),
			i(2, ""),
		}
	),
	target_table = snippets,
	pattern = { "*/snippets/*.lua" },
	keymaps = { "<C-k><C-c>" },
})

-- Create Lua Snippet
local createLuaSnippet_keymaps_fmt = fmt(
	[[
target_table = {},
  pattern = {{ "{}" }},
  keymaps = {{ {} }},
  ]],
	{
		c(1, { t("snippets"), t("autosnippets") }),
		sn(2, { t("*."), i(1, "") }),
		i(3, ""),
	}
)

local createLuaSnippet_fmt = fmt(
	[[
cs({{
	trigger = "{}",
	nodes = fmt(
    [=[
{}
]=],
    {{
      {}
    }}
  ),
  {}
}})
]],
	{
		i(3, "_trigger"),
		i(1, ""),
		i(2, ""),
		c(4, { createLuaSnippet_keymaps_fmt, t("target_table = snippets"), t("target_table = autosnippets") }),
	}
)

cs({
	trigger = "createLuaSnippet",
	nodes = createLuaSnippet_fmt,
	target_table = snippets,
	pattern = { "*/snippets/*.lua" },
	keymaps = { "<C-K>c", "<C-J>cs" },
})
