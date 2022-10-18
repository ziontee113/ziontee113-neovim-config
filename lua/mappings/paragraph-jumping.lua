local function handle_top_bottom_line_jump(jumpCmd)
	vim.cmd(jumpCmd)
	local curLine = vim.api.nvim_win_get_cursor(0)[1]
	if curLine == 2 and jumpCmd == "keepjumps normal! k{j" then
		vim.cmd("normal! k")
	elseif curLine + 1 == vim.api.nvim_buf_line_count(0) then
		vim.cmd("normal! j")
	end
end

vim.keymap.set("x", "<A-j>", function()
	handle_top_bottom_line_jump("keepjumps normal! j}k")
end)
vim.keymap.set("x", "<A-k>", function()
	handle_top_bottom_line_jump("keepjumps normal! k{j")
end)
vim.keymap.set("n", "<A-j>", function()
	handle_top_bottom_line_jump("keepjumps normal! j}k")
end)
vim.keymap.set("n", "<A-k>", function()
	handle_top_bottom_line_jump("keepjumps normal! k{j")
end)

vim.keymap.set("n", "<A-h>", function()
	handle_top_bottom_line_jump("keepjumps normal! {")
end)
vim.keymap.set("n", "<A-l>", function()
	handle_top_bottom_line_jump("keepjumps normal! }")
end)
