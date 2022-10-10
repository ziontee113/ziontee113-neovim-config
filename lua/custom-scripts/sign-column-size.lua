local augroup = vim.api.nvim_create_augroup("sign-column-size", {})

vim.api.nvim_create_autocmd({ "WinEnter" }, {
	pattern = "*",
	group = augroup,
	callback = function()
		vim.o.number = true
		vim.o.relativenumber = true
	end,
})

vim.api.nvim_create_autocmd({ "WinLeave" }, {
	pattern = "*",
	group = augroup,
	callback = function()
		vim.o.number = false
		vim.o.relativenumber = false
	end,
})
