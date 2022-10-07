local sj = require("sj")
sj.setup({
	auto_jump = true,
	use_overlay = true,
	highlights = {
		-- used for the labels
		SjLabel = { bold = false },
		-- used for everything that is not a match
		SjOverlay = { bold = false, italic = false },
		-- used to highlight matches
		SjSearch = { bold = false },
		-- used in the cmd line when the pattern has no matches
		SjWarning = { bold = false },
	},
	separator = ":", -- separator used to extract pattern and label from the user input

	-- stylua: ignore
	labels = {
		"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
		"n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
		"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
		"N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
		"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ",", ";", "!",
	},
})

vim.keymap.set("n", "s", sj.run)
