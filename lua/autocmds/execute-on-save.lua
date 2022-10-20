local group = vim.api.nvim_create_augroup("Execute On Save", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*/.config/nvim/*.lua",
	group = group,
	callback = function()
		--get the last line of the buffer
		local last_line = vim.api.nvim_buf_get_lines(0, -2, -1, false)

		-- if string matches {{{nvim-execute-on-save}}}
		if string.match(last_line[1], "{{{nvim%-execute%-on%-save}}}") then
			vim.cmd("luafile %")
		end
	end,
})

-- {{{nvim-execute-on-save}}}
