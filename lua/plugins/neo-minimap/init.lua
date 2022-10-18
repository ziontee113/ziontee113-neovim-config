local nm = require("neo-minimap")

-- Lua
nm.set("zi", "lua", {
	query = [[
;; query
((for_statement) @cap)
((function_call (dot_index_expression) @field (#eq? @field "vim.keymap.set")) @cap)
((function_declaration) @cap)
((assignment_statement(expression_list((function_definition) @cap))))
((function_call (identifier)) @cap (#vim-match? @cap "^__*" ))
  ]],
	search_patterns = {
		{ "function", "<C-j>", true },
		{ "function", "<C-k>", false },
		{ "keymap", "<A-j>", true },
		{ "keymap", "<A-k>", false },
	},
	regex = { [[\.insert]] },
	open_win_opts = { border = "double" },
	win_opts = { scrolloff = 1 },
})

-- Lua Snippets
vim.keymap.set("n", "zo", function()
	nm.browse({
		query = [[
;; query
((function_declaration) @cap)
  ]],
		hotswap = true,
	})
end)

-- TSX
nm.set("zi", { "typescriptreact", "javascriptreact" }, {
	query = [[
;; query
((function_declaration) @cap)
((arrow_function) @cap)
((identifier) @cap (#vim-match? @cap "^use.*"))
  ]],
})
