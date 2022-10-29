-- Packer
require("packer.packer-config")

-- Settings
require("settings.basic-settings")
require("settings.system-settings")
require("settings.colorscheme")

-- File Navigation
require("plugins.telescope.telescope-config")

-- Intelligent Code Interaction
require("lsp-config")
require("null-ls-config")
require("tree-sitter-config")
require("luasnip-config")
require("cmp-config")

require("plugins.syntax-tree-surfer")

-- Additional Highlighting
require("plugins.colorizer")
require("plugins.surround")

-- Workspace Management
require("plugins.tabby")

-- Todo Comments
require("todo-comments").setup({})

-- Gomove
require("plugins.gomove")

-- Mini.nvim
require("mini.ai").setup() -- targets.vim

-- Mappings
require("mappings.basic-mappings")
require("mappings.paragraph-jumping")

-- Custom Scripts
require("global-variables")
require("custom-scripts")

-- Custom Autocmds
require("autocmds.execute-on-save")

-- Leap
vim.keymap.set("n", "s", function()
	vim.cmd("WindowsDisableAutowidth")

	require("leap").leap({
		target_windows = vim.tbl_filter(function(win)
			return vim.api.nvim_win_get_config(win).focusable
		end, vim.api.nvim_tabpage_list_wins(0)),
	})

	vim.schedule(function()
		vim.cmd("WindowsEnableAutowidth")
	end)
end, {})

-- Icons
require("icon-picker").setup({
	disable_legacy_commands = true,
})
vim.keymap.set("i", "<A-i>", "<cmd>IconPickerInsert<cr>", {})
vim.keymap.set("n", "<Leader><Leader>i", "<cmd>IconPickerNormal<cr>", {})

--In Development
vim.cmd([[set runtimepath+=~/.config/nvim-custom-plugin/neo-minimap/]])
require("neo-minimap")
vim.keymap.set("n", "<F1>", function()
	R("neo-minimap")
end, {})

vim.cmd([[set runtimepath+=~/.config/nvim-custom-plugin/query-secretary/]])
local query_secretary = require("query-secretary")
vim.keymap.set("n", "<Leader>r", function()
	R("query-secretary")
end, {})
vim.keymap.set("n", "<BS>", function()
	query_secretary.query_window_initiate()
end, {})

-- Notify
local notify = require("notify")
vim.notify = notify
notify.setup({
	background_colour = "#000000",
	timeout = 2000,
})
