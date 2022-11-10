------------ Set up
local neotest = require("neotest")
neotest.setup({
	adapters = {
		require("neotest-plenary"),
	},
})

-- Mappings
vim.keymap.set("n", "tu", function()
	neotest.run.run() -- current test
end, {})

vim.keymap.set("n", "tt", function()
	require("neotest").run.run(vim.fn.expand("%")) -- current file
end, {})

vim.keymap.set("n", "to", function()
	neotest.output.open({ enter = true }) -- output window
end, {})

vim.keymap.set("n", "TT", function()
	require("neotest").run.run(vim.fn.expand("%:p:h:h")) -- entire test folder?
end, {})

vim.keymap.set("n", "TS", function()
	require("neotest").summary.toggle() -- summary tree
end, {})

-- {{{nvim-execute-on-save}}}
