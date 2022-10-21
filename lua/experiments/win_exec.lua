local ns = vim.api.nvim_create_namespace("test")
vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)

local extmark = vim.api.nvim_buf_set_extmark(0, ns, 0, 1, {
	virt_text = { { "hello venus", "Normal" } },
})

N(vim.api.nvim_buf_get_extmark_by_id(0, ns, extmark, {}))

vim.keymap.set("n", "<C-x>", function()
	vim.api.nvim_win_call(1002, function()
		vim.cmd("norm! j")
	end)
end)
vim.keymap.set("n", "<C-y>", function()
	vim.api.nvim_win_call(1002, function()
		vim.cmd("norm! k")
	end)
end)

-- {{{nvim-execute-on-save}}}
