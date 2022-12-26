require("colorizer").setup({
	filetypes = {
		"*", -- Highlight all files, but customize some others.
		typescriptreact = { mode = "foreground", tailwind = true },
		svelte = { mode = "background", tailwind = true },
		rust = { mode = "foreground", tailwind = true },
	},
})
