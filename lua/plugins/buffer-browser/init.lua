local buffer_browser = require("buffer-browser")

-- Lua
vim.keymap.set("n", "zi", function()
	buffer_browser.browse({
		query = [[
;; query
((for_statement) @cap)
((function_call (dot_index_expression) @field (#eq? @field "vim.keymap.set")) @cap)
((function_declaration) @cap)
  ]],
	})
end)

-- TSX
vim.keymap.set("n", "zo", function()
	buffer_browser.browse({
		query = [[
;; query
((function_declaration) @cap)
((arrow_function) @cap)
  ]],
	})
end)
