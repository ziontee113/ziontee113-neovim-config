---@diagnostic disable: undefined-global
---@diagnostic disable-next-line: unused-local
local snippets, autosnippets, cs = {}, {}, require("luasnip-config.luasnip-utils").create_snippet

-- Project Specific

-- if statement
cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
if {} {{
    {}
}}
]=],
		{
			i(1, ""),
			i(2, ""),
		}
	),
	target_table = snippets,
	pattern = { "*.rs" },
	keymaps = { "<C-j><C-i>" },
})

-- match statement
cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
match {} {{
    {}
}}
]=],
		{
			i(1, ""),
			i(2, ""),
		}
	),
	target_table = snippets,
	pattern = { "*.rs" },
	keymaps = { "<C-k><C-m>" },
})

-- #[cfg(test)]
cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
#[cfg(test)]
]=],
		{}
	),
	target_table = snippets,
	pattern = { "*.rs" },
	keymaps = { "<C-l><C-t>" },
})

-- stringify!
cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
stringify!({})
]=],
		{
			i(1, ""),
		}
	),
	target_table = snippets,
	pattern = { "*.rs" },
	keymaps = { "<C-j><C-k>" },
})

-- enum
cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
{}enum {} {{
    {}
}}
]=],
		{
			c(1, { t("pub "), t("") }),
			i(2, "EnumName"),
			i(3, ""),
		}
	),
	target_table = snippets,
	pattern = { "*.rs" },
	keymaps = { "<C-k>e" },
})

-- trait
cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
pub trait {} {{
    fn {}({}) {} {};
}}
]=],
		{
			i(1, "TraitName"),
			i(2, "fn_name"),
			i(3, "&self"),
			i(4, ""),
			i(5, ""),
		}
	),
	target_table = snippets,
	pattern = { "*.rs" },
	keymaps = { "<C-k>t" },
})

-- TODO comment:
cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
{}
]=],
		{
			c(1, { fmt("// TODO: {}", { i(1, "") }), t("todo!();") }),
		}
	),
	target_table = snippets,
	pattern = { "*.rs" },
	keymaps = { "<A-,>" },
})

-- #[derrive()]
cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
#[derive({})]
]=],
		{
			i(1, "Debug"),
		}
	),
	target_table = snippets,
	pattern = { "*.rs" },
	keymaps = { "<C-d>d" },
})

-- Print Debug

local fmt_println_str_only = fmt(
	[=[
println!("{}");
]=],
	{
		i(1, ""),
	}
)

local fmt_println_1_arg = fmt(
	[=[
println("{{}}", {});
]=],
	{
		i(1, ""),
	}
)

cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
{}
]=],
		{
			c(1, { fmt_println_1_arg, fmt_println_str_only }),
		}
	),
	target_table = snippets,
	pattern = { "*.rs" },
	keymaps = { "<C-J><C-P>" },
})

cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
println!("{} {{:#?}}", {})
]=],
		{
			i(1, ""),
			i(2, ""),
		}
	),
	target_table = snippets,
	pattern = { "*.rs" },
	keymaps = { "<C-J>p" },
})

-- Arc Mutex Type
cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
Arc<Mutex<{}>>
]=],
		{
			i(1, ""),
		}
	),
	target_table = snippets,
	pattern = { "*.rs" },
	keymaps = { "<C-k>A" },
})

-- Arc Mutex
cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
Arc::new(Mutex::new({}))
]=],
		{
			i(1, ""),
		}
	),
	target_table = snippets,
	pattern = { "*.rs" },
	keymaps = { "<C-k>a" },
})

-- Variable Declaration

cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
let {} = {};
]=],
		{
			i(1, ""),
			i(2, ""),
		}
	),
	target_table = snippets,
	pattern = { "*.rs" },
	keymaps = { "<C-L><C-L>" },
})

-- Test Macro
cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
#[cfg(test)]
mod {}_test {{
    use super::*;

    #[test]
    fn {}() {{
        assert_eq!({});
    }}
}}
]=],
		{
			i(1, "module"),
			i(2, "test_fn_name"),
			i(3, "expression"),
		}
	),
	target_table = snippets,
	pattern = { "*.rs" },
	keymaps = { "<C-t>t" },
})

-- Test Function
cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
#[test]
fn {}() {{
    {}
}}
]=],
		{
			i(1, "test_fn_name"),
			i(2, ""),
		}
	),
	target_table = snippets,
	pattern = { "*.rs" },
	keymaps = { "<C-t>f", "<C-l><C-j>" },
})

-- For Loop
cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
for {} in {} {{
    {}
}}
]=],
		{
			i(1, ""),
			i(2, ""),
			i(3, ""),
		}
	),
	target_table = snippets,
	pattern = { "*.rs" },
	keymaps = { "<C-f>o" },
})

-- For Loop with Enumerate
cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
for {} in {}.iter().enumerate() {{
    {}
}}
]=],
		{
			i(1, ""),
			i(2, ""),
			i(3, ""),
		}
	),
	target_table = snippets,
	pattern = { "*.rs" },
	keymaps = { "<C-f>e" },
})

-- Function

cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
{}fn {}({}){} {{
    {}
}}
]=],
		{
			c(1, { t("pub "), t("") }),
			i(2, "fn_name"),
			c(3, { i(1, ""), i(1, "&self") }),
			c(4, {
				i(1, ""),
				sn(1, { t(" -> "), i(1, "") }),

				sn(1, { t(" -> "), t("Self") }),
			}),
			i(5, "// TODO:"),
		}
	),
	target_table = snippets,
	pattern = { "*.rs" },
	keymaps = { "<C-J>f" },
})

-- ==== Struct Related ==== --

-- struct
local _struct_fmt = fmt(
	[=[
 {{
    {}: {},
}}
]=],
	{
		i(1, "field"),
		i(2, "Type"),
	}
)

cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
{}struct {}{}
]=],
		{
			c(1, { t("pub "), i(1, "") }),
			i(2, "StructName"),
			c(3, { t(";"), _struct_fmt }),
		}
	),
	target_table = snippets,
	pattern = { "*.rs" },
	keymaps = { "<C-k><C-s>" },
})

-- impl
cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
impl {} {{
    {}
}}
]=],
		{
			i(1, "StructName"),
			i(2, ""),
		}
	),
	target_table = snippets,
	pattern = { "*.rs" },
	keymaps = { "<C-k><C-i>" },
})

-- pub fn new -> Self
cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
pub fn {}({}: {}) -> Self {{
    {}
}}
]=],
		{
			i(1, "new"),
			i(2, "arg"),
			i(3, "type"),
			i(4, "// TODO:"),
		}
	),
	target_table = snippets,
	pattern = { "*.rs" },
	keymaps = { "<C-j>pn" },
})

-- ==== Tauri ==== --

-- Tauri Command
cs({
	trigger = "tauri_command",
	nodes = fmt(
		[=[
#[tauri::command]
fn {}({}: {}) -> {} {{
    {}
}}
]=],
		{
			i(1, "tauri_fn_name"),
			i(2, "argument"),
			c(3, {
				t("argument_type"),
				t("&str"),
			}),
			c(4, {
				t("return_type"),
				t("String"),
			}),
			i(5, "// TODO:"),
		}
	),
	target_table = snippets,
	pattern = { "*.rs" },
	keymaps = { "<C-K>f" },
})
