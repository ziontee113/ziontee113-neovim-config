-- Text Objects
vim.cmd([[
    nmap <C-k><C-k> ciq
    nmap <C-k><C-j> cilq
    nmap <C-k><C-h> c2ilq
    nmap <C-k><C-l> cinq
    nmap <C-k><C-;> c2inq
]])

-- ThePrimeagen
vim.keymap.set("n", "J", "mzJ`z", {})
vim.keymap.set("n", "<C-d>", "<C-d>zz", {})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {})
vim.keymap.set("n", "n", "nzzzv", {})
vim.keymap.set("n", "N", "Nzzzv", {})
vim.keymap.set("x", "<A-p>", '"_dP', {})
vim.keymap.set("x", "<", "<gv", {})
vim.keymap.set("x", ">", ">gv", {})

-- Rust WASM
vim.api.nvim_set_keymap("n", "<F7>", "vi{:! prettier --parser html --stdin-filepath<CR>vi{>", { noremap = true })

-- Insert Mode Mappings
vim.keymap.set({ "i", "s" }, "<A-m>", "_")
vim.keymap.set({ "i", "s" }, "<A-/>", "_")

-- Vim Mappings
vim.keymap.set("n", "<C-S>", ":w<CR>")
vim.keymap.set({ "i", "s" }, "<C-S>", "<Esc>:w<CR>")

vim.keymap.set("n", "<F9>", ":wa<CR>")

vim.keymap.set("n", "<C-;>", ":w<CR>")
vim.keymap.set({ "i", "s" }, "<C-;>", "<Esc>:w<CR>")

vim.keymap.set("n", "<C-0>", ":source Session.vim<CR>")

-- Visual Mode
vim.keymap.set("n", "vv", "viw")

-- Treesitter
vim.keymap.set("n", "zt", "<cmd>TSPlaygroundToggle<cr>")
vim.keymap.set("n", "<Leader>t", "<cmd>TSPlaygroundToggle<cr>")

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

vim.keymap.set("n", "Q", ":q<cr>")
vim.keymap.set("n", "<Leader>q", ":q<cr>")
vim.keymap.set("n", "<Leader><Leader>q", ":qa!<cr>")

-- Help Search
vim.keymap.set("n", "<C-A-;>", ":vert help <C-r><C-w><CR>", {})

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
vim.keymap.set("n", "<C-n>", ":Telescope notify<CR>")
vim.keymap.set("n", "=", ":Telescope help_tags<CR>")
vim.keymap.set("n", "-", ":Telescope keymaps<CR>")
vim.keymap.set("n", "<Leader><CR>", ":Telescope lsp_dynamic_workspace_symbols<CR>")
vim.keymap.set("n", "<CR>", ":Telescope lsp_document_symbols<CR>")
vim.keymap.set("n", "<Leader>N", ":Telescope notify<CR>")

-- vim.keymap.set("n", "<C-N>", function()
-- 	require("telescope").extensions.neoclip.neoclip({
--
-- 		layout_config = {
-- 			preview_width = 0.4,
-- 		},
-- 	})
-- end)

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

-- Targets.vim (Mini.ai)
vim.api.nvim_set_keymap("n", "<Leader>h", "ciq", {})
vim.api.nvim_set_keymap("n", "<Leader>j", "ci{", {})
vim.api.nvim_set_keymap("n", "<Leader>k", "ci)", {})
vim.api.nvim_set_keymap("n", "<Leader>l", "ci[", {})
vim.api.nvim_set_keymap("n", "<Leader><C-l>", "c2inq", {})
vim.api.nvim_set_keymap("n", "<Leader><C-j>", "cilq", {})
vim.api.nvim_set_keymap("n", "<Leader><C-k>", "cinq", {})
vim.api.nvim_set_keymap("n", "<Leader><C-h>", "c2ilq", {})

-- Stuffs
vim.keymap.set({ "n", "x", "o" }, "0", "^", {})
vim.keymap.set({ "n", "x", "o" }, "^", "0", {})

-- {{{nvim-execute-on-save}}}
