-- require("custom-scripts.sign-column-size")

-- CWD Custom Script

local augroup = vim.api.nvim_create_augroup("CWD_Custom_Script", {})
vim.api.nvim_create_autocmd({ "VimEnter" }, {
	pattern = "*",
	group = augroup,
	callback = function()
		ENTER_CWD = vim.fn.getcwd()
	end,
})

local function smart_save_session()
	local current_dir = vim.fn.getcwd()
	vim.cmd("cd " .. ENTER_CWD)
	print("cd into " .. ENTER_CWD)
	vim.cmd("mks! Session.vim")
	print("mks!")
	vim.cmd("cd " .. current_dir)
	print("cd back to " .. current_dir)
end
local function close_hidden_buffers()
	require("close_buffers").delete({ type = "hidden", force = true })
	print("force closed all hidden buffers")
end

vim.keymap.set("n", "<C-7>", function()
	smart_save_session()
end)

-- bdelete
vim.keymap.set("n", "<C-8>", function()
	close_hidden_buffers()
end)

-- F12
vim.keymap.set("n", "<F12>", function()
	close_hidden_buffers()
	smart_save_session()
	vim.cmd("qa!")
end, {})

-- {{{nvim-execute-on-save}}}
