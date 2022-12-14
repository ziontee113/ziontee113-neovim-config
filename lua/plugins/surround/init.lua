require("nvim-surround").setup({
	aliases = {
		["j"] = "}",
		["k"] = ")",
		["l"] = "]",
		["h"] = '"',
		["q"] = '"',
	},
	keymaps = {
		insert = "<C-g>s",
		insert_line = "<C-g>S",
		normal = "ys",
		normal_cur = "yss",
		normal_line = "yS",
		normal_cur_line = "ySS",
		visual = "S",
		visual_line = "<Leader>S",
		delete = "ds",
		change = "cs",
	},
})

-- {{{nvim-execute-on-save}}}
