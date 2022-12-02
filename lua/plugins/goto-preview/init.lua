local goto_preview = require("goto-preview")

require("goto-preview").setup({})

vim.keymap.set("n", "gpd", function()
	goto_preview.goto_preview_definition()
end, {})
vim.keymap.set("n", "gpr", function()
	goto_preview.goto_preview_references()
end, {})
vim.keymap.set("n", "gpi", function()
	goto_preview.goto_preview_implementation()
end, {})

-- {{{nvim-execute-on-save}}}
