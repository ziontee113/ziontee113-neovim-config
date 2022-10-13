---@diagnostic disable: undefined-global

---@diagnostic disable-next-line: unused-local
local snippets, autosnippets, cs = {}, {}, require("luasnip-config.luasnip-utils").create_snippet

-- Rust

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

-- Variable Declaration

cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
let {} = {}
]=],
		{
			i(1, ""),
			i(2, ""),
		}
	),
	target_table = snippets,
	pattern = { "*.rs" },
	keymaps = { "<C-J><C-K>" },
})

-- Function

cs({
	trigger = "_trigger",
	nodes = fmt(
		[=[
fn {}({}){} {{
    {}
}}
]=],
		{
			i(1, "fn_name"),
			i(2, ""),
			c(3, {
				i(1, ""),
				sn(1, { t(" -> "), i(1, "") }),
			}),
			i(4, "// TODO:"),
		}
	),
	target_table = snippets,
	pattern = { "*.rs" },
	keymaps = { "<C-J>f" },
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
