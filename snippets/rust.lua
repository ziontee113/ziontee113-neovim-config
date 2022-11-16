---@diagnostic disable: undefined-global

---@diagnostic disable-next-line: unused-local
local snippets, autosnippets, cs = {}, {}, require("luasnip-config.luasnip-utils").create_snippet

-- Rust

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
			c(1, { i(1, ""), t("pub ") }),
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

-- let match

cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
let {} = match {} {{
    Ok({}) => {},
    Err({}) => {{
        println!("{} {{:#?}}", {});
        return;
    }},
}};
]=],
		{
			i(1, ""),
			i(2, ""),
			i(3, "result"),
			i(4, "result"),
			i(5, "err"),
			i(6, "error while "),
			i(7, "err"),
		}
	),
	target_table = snippets,
	pattern = { "*.rs" },
	keymaps = { "<C-L><C-M>" },
})

-- Print Debug

cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
println!("{}")
]=],
		{
			i(1, ""),
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
	keymaps = { "<C-k>A" },
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
	keymaps = { "<C-J><C-K>", "<C-L><C-L>" },
})

-- Test Macro
cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
#[cfg(test)]
mod {} {{
    use super::*;

    #[test]
    fn {}() {{
        assert_eq!({});
    }}
}}
]=],
		{
			i(1, "test"),
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
    assert_eq!({}, {});
}}
]=],
		{
			i(1, "test_fn_name"),
			i(2, "left_side"),
			i(3, "right_side"),
		}
	),
	target_table = snippets,
	pattern = { "*.rs" },
	keymaps = { "<C-t>f" },
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
			c(1, { t(""), t("pub ") }),
			i(2, "fn_name"),
			i(3, ""),
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
