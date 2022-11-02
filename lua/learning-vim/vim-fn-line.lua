local function test_vim_fn_line_col()
	local first_line, last_line = vim.fn.line("w0"), vim.fn.line("w$")

	local v_line_start, v_col_start = vim.fn.line("v"), vim.fn.col("v")
	local v_line_end, v_col_end = vim.fn.line("."), vim.fn.col(".")

	N({ { first_line, last_line }, { v_line_start, v_col_start }, { v_line_end, v_col_end } })
end

local function jump_25_percent(percent)
	local first_line, last_line = vim.fn.line("w0"), vim.fn.line("w$")
	local total_lines = last_line - first_line

	local distance = total_lines * percent
	local destination = first_line + distance

	local jump_cmd = "norm! " .. tostring(destination) .. "gg"
	vim.cmd(jump_cmd)
end

vim.keymap.set("n", "<A-9>", function()
	vim.cmd("m'")

	local number_of_empty_lines = 4
	local empty_lines = {}
	for _ = 1, number_of_empty_lines do
		table.insert(empty_lines, "")
	end
	vim.api.nvim_buf_set_lines(0, 3, 3, false, empty_lines)

	local command = "norm! " .. tostring(number_of_empty_lines) .. ""
	vim.cmd(command)
end, {})

-- {{{nvim-execute-on-save}}}
