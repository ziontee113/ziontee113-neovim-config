---@diagnostic disable: undefined-global

---@diagnostic disable-next-line: unused-local
local snippets, autosnippets, cs = {}, {}, require("luasnip-config.luasnip-utils").create_snippet

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
	keymaps = { "<C-J>l" },
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

-- ==== LuaSnip ==== --

-- Snippet Node
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
	pattern = { "*/snippets/*.lua", "*/hydra-snippets/*.lua" },
	keymaps = { "<C-K>sn" },
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
		c(4, { t("target_table = snippets"), createLuaSnippet_keymaps_fmt, t("target_table = autosnippets") }),
	}
)

cs({
	trigger = "createLuaSnippet",
	nodes = createLuaSnippet_fmt,
	target_table = snippets,
	pattern = { "*/snippets/*.lua", "*/hydra-snippets/*.lua" },
	keymaps = { "<C-K>c", "<C-J>cs" },
})
