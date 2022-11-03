local function handle_top_bottom_line_jump(jumpCmd)
	vim.cmd(jumpCmd)
	local curLine = vim.api.nvim_win_get_cursor(0)[1]
	if curLine == 2 and jumpCmd == "keepjumps normal! k{j" then
		vim.cmd("normal! k")
	elseif curLine + 1 == vim.api.nvim_buf_line_count(0) then
		vim.cmd("normal! j")
	end
end

vim.keymap.set({ "n", "x", "o" }, "<A-j>", function()
	handle_top_bottom_line_jump("keepjumps normal! j}k")
end)
vim.keymap.set({ "n", "x", "o" }, "<A-k>", function()
	handle_top_bottom_line_jump("keepjumps normal! k{j")
end)

vim.keymap.set({ "n", "x", "o" }, "<A-h>", function()
	vim.cmd("keepjumps normal! {")
end)
vim.keymap.set({ "n", "x", "o" }, "<A-l>", function()
	vim.cmd("keepjumps normal! }")
end)
