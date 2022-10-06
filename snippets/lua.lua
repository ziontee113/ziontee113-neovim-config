---@diagnostic disable: undefined-global
local snippets, autosnippets, cs = {}, {}, require("luasnip-config.luasnip-utils").create_snippet

-- Create Lua Snippet
local createLuaSnippet_keymaps_fmt = fmt(
    [[
target_table = {},
  pattern = "{}",
  keymaps = {{ {} }},
  ]] ,
    {
        c(1, { t("snippets"), t("autosnippets") }),
        i(2, ""),
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
]]   ,
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
    keymaps = { "jcs" },
})
