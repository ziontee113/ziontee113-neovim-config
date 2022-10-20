local nm = require("neo-minimap")

nm.source_on_save("/home/ziontee113/.config/nvim/lua/plugins/neo-minimap/")

-- Lua
nm.set({ "zi", "zo", "zu" }, "*.lua", {
	events = { "BufEnter" },

	query = {
		[[
    ;; query
    ((function_declaration) @cap)
    ((assignment_statement(expression_list((function_definition) @cap))))
    ]],
		1,
		[[
    ;; query
    ((for_statement) @cap)
    ((function_declaration) @cap)
    ((assignment_statement(expression_list((function_definition) @cap))))

    ((function_call (identifier)) @cap (#vim-match? @cap "^__*" ))
    ((function_call (dot_index_expression) @field (#eq? @field "vim.keymap.set")) @cap)
    ]],
		[[
    ;; query
    ((for_statement) @cap)
    ((function_declaration) @cap)
    ((assignment_statement(expression_list((function_definition) @cap))))
    ]],
	},

	regex = {
		{},
		{ [[^\s*--\s\+\w\+]], [[--\s*=]] },
		{},
	},

	search_patterns = {
		{ "function", "<C-j>", true },
		{ "function", "<C-k>", false },
		{ "keymap", "<A-j>", true },
		{ "keymap", "<A-k>", false },
	},

	-- auto_jump = false,
	height_toggle = { 12, 5, 36 },
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
