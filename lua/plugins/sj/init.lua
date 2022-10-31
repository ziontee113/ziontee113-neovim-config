local sj = require("sj")
sj.setup({
	separator = " ",
})

vim.keymap.set("n", "!", function()
	sj.run({ select_window = true })
end)

vim.keymap.set("n", "<A-!>", function()
	sj.select_window()
end)

-- {{{nvim-execute-on-save}}}
