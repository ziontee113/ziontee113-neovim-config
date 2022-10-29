local function leap_multi_win()
	vim.cmd("WindowsDisableAutowidth")

	require("leap").leap({
		target_windows = vim.tbl_filter(function(win)
			return vim.api.nvim_win_get_config(win).focusable
		end, vim.api.nvim_tabpage_list_wins(0)),
	})

	vim.schedule(function()
		vim.cmd("WindowsEnableAutowidth")
	end)
end
vim.keymap.set("n", "s", function()
	leap_multi_win()
end, {})
vim.keymap.set({ "n", "x" }, "'", function()
	vim.cmd("norm! ")
	leap_multi_win()
	vim.schedule(function()
		vim.cmd("norm vn")
	end)
end, {})
vim.keymap.set({ "n", "x" }, "n", function()
	vim.cmd("norm! ")
	leap_multi_win()
	vim.schedule(function()
		vim.cmd("norm vx")
	end)
end, {})

vim.keymap.set("x", "x", function()
	vim.cmd("norm! ")
	vim.cmd("norm vx")
end, {})

-- {{{nvim-execute-on-save}}}
