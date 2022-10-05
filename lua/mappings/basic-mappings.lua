vim.keymap.set("n", "<C-S>", ":w<CR>")
vim.keymap.set("i", "<C-S>", "<Esc>:w<CR>")

vim.keymap.set("n", "<C-0>", ":source Session.vim<CR>")

-------------------

vim.keymap.set("n", "\\", ":NvimTreeToggle<CR>")

vim.keymap.set("n", "<C-P>", ":Telescope find_files<CR>")
