local neotest = require("neotest")
neotest.setup({
	adapters = {
		require("neotest-plenary"),
	},
})

-- Mappings
vim.keymap.set("n", "<A-t>", function()
	neotest.run.run()
end, {})

vim.keymap.set("n", "<A-s-t>", function()
	neotest.output.open({ enter = true })
end, {})

-- {{{nvim-execute-on-save}}}
