local augroup = vim.api.nvim_create_augroup("sign-column-size", {})
local black_list_filetypes = {
	"",
}

vim.api.nvim_create_autocmd({ "WinEnter" }, {
	pattern = "*",
	group = augroup,
	callback = function()
		local filetype = vim.bo[0].ft

		if not vim.tbl_contains(black_list_filetypes, filetype) then
			vim.o.number = true
			vim.o.relativenumber = true
		end
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

-- {{{nvim-execute-on-save}}}
