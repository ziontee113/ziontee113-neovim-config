-- Vim Mappings
vim.keymap.set("n", "<C-S>", ":w<CR>")
vim.keymap.set("i", "<C-S>", "<Esc>:w<CR>")

vim.keymap.set("n", "<C-7>", ":mks!<CR>")
vim.keymap.set("n", "<C-0>", ":source Session.vim<CR>")

-- Windows Management
local function cmd(command)
	return table.concat({ "<Cmd>", command, "<CR>" })
end

vim.keymap.set("n", "<C-z>", cmd("WindowsMaximize"), { nowait = true })
vim.keymap.set("n", "<C-w>_", cmd("WindowsMaximizeVertically"))
vim.keymap.set("n", "<C-w>|", cmd("WindowsMaximizeHorizontally"))
vim.keymap.set("n", "<C-w>=", cmd("WindowsEqualize"))

vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Plugin Mappings

-- Neo Tree
vim.keymap.set("n", "\\", ":NeoTreeFloatToggle<CR>")

-- Telescope
vim.keymap.set("n", "<C-P>", ":Telescope find_files<CR>")
vim.keymap.set("n", "<C-9>", ":Telescope oldfiles<CR>")
vim.keymap.set("n", "<C-G>", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<C-F>", ":Telescope current_buffer_fuzzy_find<CR>")

-- Tab Navigation
vim.keymap.set("n", "zp", function()
	vim.cmd("tabprev")
end)
vim.keymap.set("n", "zn", function()
	vim.cmd("tabnext")
end)

-- Color Picker
vim.keymap.set("n", "<C-c>", "<cmd>PickColor<cr>")
vim.keymap.set("i", "<C-c>", "<cmd>PickColorInsert<cr>")

-- Comment
vim.keymap.set("n", "", "gcc", { remap = true })
vim.keymap.set("x", "", "gc", { remap = true })
