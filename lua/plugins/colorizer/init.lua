require("colorizer").setup({
	filetypes = {
		"*", -- Highlight all files, but customize some others.
		typescriptreact = { mode = "foreground", tailwind = true },
		rust = { mode = "foreground", tailwind = true },
	},
})
