local function test_vim_fn_line_col()
	local first_line, last_line = vim.fn.line("w0"), vim.fn.line("w$")

	local v_line_start, v_col_start = vim.fn.line("v"), vim.fn.col("v")
	local v_line_end, v_col_end = vim.fn.line("."), vim.fn.col(".")

	N({ { first_line, last_line }, { v_line_start, v_col_start }, { v_line_end, v_col_end } })
end

local function jump_25_percent(divide)
	local first_line, last_line = vim.fn.line("w0"), vim.fn.line("w$")
	local total_lines = last_line - first_line

	local divided = total_lines / divide
end
