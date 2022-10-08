---@diagnostic disable: undefined-global

---@diagnostic disable-next-line: unused-local
local snippets, autosnippets, cs = {}, {}, require("luasnip-config.luasnip-utils").create_snippet

-- ==== Tauri ==== --

-- Tauri Command
cs({
	trigger = "tauri_command",
	nodes = fmt(
		[=[
#[tauri::command]
fn {}({}: {}) -> {} {{
    {}
}}]
]=],
		{
			i(1, "tauri_fn_name"),
			i(2, "argument"),
			i(3, "argument_type"),
			i(4, "return_type"),
			i(5, "// TODO:"),
		}
	),
	target_table = snippets,
	pattern = { "*.rs" },
	keymaps = { "<C-K>tf" },
})
