-- Vim Mappings
vim.keymap.set("n", "<C-S>", ":w<CR>")
vim.keymap.set("i", "<C-S>", "<Esc>:w<CR>")

vim.keymap.set("n", "<C-0>", ":source Session.vim<CR>")

-- Visual Mode
vim.keymap.set("n", "vv", "viw")

-- Treesitter
vim.keymap.set("n", "zt", "<cmd>TSPlaygroundToggle<cr>")

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

vim.keymap.set("n", "<Leader>q", ":q<cr>")
vim.keymap.set("n", "<Leader><Leader>q", ":qa!<cr>")

-- Plugin Mappings

-- TypeScript

vim.keymap.set("n", "<Leader>II", ":TypescriptAddMissingImports<CR>")
vim.keymap.set("n", "<Leader>IO", ":TypescriptOrganizeImports<CR>")

-- Neo Tree
vim.keymap.set("n", "\\", ":NeoTreeFloatToggle<CR>")

-- Telescope
vim.keymap.set("n", "gh", ":Telescope highlights<CR>")
vim.keymap.set("n", "<C-P>", ":Telescope find_files<CR>")
vim.keymap.set("n", "<C-9>", ":Telescope oldfiles<CR>")
vim.keymap.set("n", "<C-G>", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<C-F>", ":Telescope current_buffer_fuzzy_find<CR>")
vim.keymap.set("n", "=", ":Telescope help_tags<CR>")
vim.keymap.set("n", "-", ":Telescope keymaps<CR>")
vim.keymap.set("n", "<Leader>N", ":Telescope notify<CR>")

vim.keymap.set("n", "<C-N>", function()
	require("telescope").extensions.neoclip.neoclip({

		layout_config = {
			preview_width = 0.4,
		},
	})
end)

-- Todo Comments
vim.keymap.set("n", "<C-T>", ":TodoTelescope<CR>")

-- Tab Navigation
vim.keymap.set("n", "zp", function()
	vim.cmd("tabprev")
end)
vim.keymap.set("n", "zn", function()
	vim.cmd("tabnext")
end)

-- Terminal
vim.keymap.set("t", "", "<C-\\><C-n>")

-- Color Picker
vim.keymap.set("n", "<C-c>", "<cmd>PickColor<cr>")
vim.keymap.set("i", "<C-c>", "<cmd>PickColorInsert<cr>")

-- Comment
vim.keymap.set("n", "", "gcc", { remap = true })
vim.keymap.set("x", "", "gc", { remap = true })
