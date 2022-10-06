-- Vim Mappings
vim.keymap.set("n", "<C-S>", ":w<CR>")
vim.keymap.set("i", "<C-S>", "<Esc>:w<CR>")

vim.keymap.set("n", "<C-7>", ":mks!<CR>")
vim.keymap.set("n", "<C-0>", ":source Session.vim<CR>")

-- Plugin Mappings

-- Neo Tree
vim.keymap.set("n", "\\", ":NeoTreeFloatToggle<CR>")

-- Telescope
vim.keymap.set("n", "<C-P>", ":Telescope find_files<CR>")
