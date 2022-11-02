local sj = require("sj")
sj.setup({
	separator = " ",
})

vim.keymap.set("n", "s", function()
	vim.cmd("WindowsDisableAutowidth")

	sj.run({ multi_windows = true })

	vim.schedule(function()
		vim.cmd("WindowsEnableAutowidth")
	end)
end)

-- {{{nvim-execute-on-save}}}
