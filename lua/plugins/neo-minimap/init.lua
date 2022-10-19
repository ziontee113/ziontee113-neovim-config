local nm = require("neo-minimap")

nm.clear_all()
nm.source_on_save("/home/ziontee113/.config/nvim/lua/plugins/neo-minimap/")

-- Lua
nm.set("zi", "*.lua", {
	events = { "BufEnter" },

	query = {
		[[
    ;; query
    ((function_declaration) @cap)
    ((assignment_statement(expression_list((function_definition) @cap))))
    ]],
		[[
    ;; query
    ((function_declaration) @cap)
    ((assignment_statement(expression_list((function_definition) @cap))))
    ((for_statement) @cap)
    ]],
		[[
    ;; query
    ((for_statement) @cap)
    ((function_call (dot_index_expression) @field (#eq? @field "vim.keymap.set")) @cap)
    ((function_declaration) @cap)
    ((assignment_statement(expression_list((function_definition) @cap))))
    ((function_call (identifier)) @cap (#vim-match? @cap "^__*" ))
    ]],
	},

	-- regex = {
	-- 	{ [[\.insert]] },
	-- 	{},
	-- 	1,
	-- },

	search_patterns = {
		{ "function", "<C-j>", true },
		{ "function", "<C-k>", false },
		{ "keymap", "<A-j>", true },
		{ "keymap", "<A-k>", false },
	},

	-- auto_jump = false,
	-- height_toggle = { 12, 36 },
	-- open_win_opts = { border = "double" },
	win_opts = { scrolloff = 1 },
})

-- Typescript React
nm.set("zi", { "typescriptreact", "javascriptreact" }, {
	query = [[
;; query
((function_declaration) @cap)
((arrow_function) @cap)
((identifier) @cap (#vim-match? @cap "^use.*"))
  ]],
})
