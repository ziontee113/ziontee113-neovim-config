local o = vim.opt

o.fileencoding = "utf-8"
o.termguicolors = true

o.swapfile = false
o.undofile = true

vim.cmd [[set clipboard+=unnamedplus]]
vim.cmd [[au BufEnter * :set formatoptions-=cro]]
vim.cmd [[set nohlsearch]]
