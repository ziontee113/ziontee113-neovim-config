require("colorizer").setup({
	filetypes = {
		"*", -- Highlight all files, but customize some others.
		typescriptreact = { mode = "foreground", tailwind = true },
	},
})
