-- CWD Custom Script

local augroup = vim.api.nvim_create_augroup("CWD_Custom_Script", {})
vim.api.nvim_create_autocmd({ "VimEnter" }, {
	pattern = "*",
	group = augroup,
	callback = function()
		ENTER_CWD = vim.fn.getcwd()
	end,
})

vim.keymap.set("n", "<C-7>", function()
	local current_dir = vim.fn.getcwd()
	vim.cmd("cd " .. ENTER_CWD)
	print("cd into " .. ENTER_CWD)
	vim.cmd("mks! Session.vim")
	print("mks!")
	vim.cmd("cd " .. current_dir)
	print("cd back to " .. current_dir)
end)
