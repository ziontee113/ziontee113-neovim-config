-- Vim Mappings
vim.keymap.set("n", "<C-S>", ":w<CR>")
vim.keymap.set("i", "<C-S>", "<Esc>:w<CR>")

vim.keymap.set("n", "<C-7>", ":mks!<CR>")
vim.keymap.set("n", "<C-0>", ":source Session.vim<CR>")

-- Windows Management
local function cmd(command)
    return table.concat({ '<Cmd>', command, '<CR>' })
end

vim.keymap.set('n', '<C-z>', cmd 'WindowsMaximize', { nowait = true })
vim.keymap.set('n', '<C-w>_', cmd 'WindowsMaximizeVertically')
vim.keymap.set('n', '<C-w>|', cmd 'WindowsMaximizeHorizontally')
vim.keymap.set('n', '<C-w>=', cmd 'WindowsEqualize')

vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Plugin Mappings

-- Neo Tree
vim.keymap.set("n", "\\", ":NeoTreeFloatToggle<CR>")

-- Telescope
vim.keymap.set("n", "<C-P>", ":Telescope find_files<CR>")
