-- Zion Kit
vim.cmd([[set runtimepath+=~/.config/nvim-custom-plugin/zion-kit/]])
require("zion-kit")

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

-- Goto Preview
require("plugins.goto-preview")

-- Mappings
require("mappings.basic-mappings")
require("mappings.paragraph-jumping")

-- Custom Scripts
require("global-variables")
require("custom-scripts")
require("custom-scripts.toggle-diagnostics")

-- Custom Autocmds
require("autocmds.execute-on-save")

-- Leap / SJ
-- require("plugins.leap")
require("plugins.sj")

-- Icons
require("icon-picker").setup({
	disable_legacy_commands = true,
})
vim.keymap.set("i", "<A-i>", "<cmd>IconPickerInsert<cr>", {})
vim.keymap.set("n", "<Leader><Leader>i", "<cmd>IconPickerNormal<cr>", {})

-- NeoTest
require("plugins.neotest")

--------------------------------------- MESS DOWN HERE
---------------------------------------
---------------------------------------
---------------------------------------
---------------------------------------
---------------------------------------
---------------------------------------
---------------------------------------
---------------------------------------
---------------------------------------
---------------------------------------
---------------------------------------
---------------------------------------
---------------------------------------
---------------------------------------
---------------------------------------
---------------------------------------
---------------------------------------
---------------------------------------
---------------------------------------
---------------------------------------
---------------------------------------

--In Development  HACK:
vim.cmd([[set runtimepath+=~/.config/nvim-custom-plugin/neo-minimap/]])
require("plugins.neo-minimap")

-- require("plugins.sj")

vim.cmd([[set runtimepath+=~/.config/nvim-custom-plugin/query-secretary/]])
local query_secretary = require("query-secretary")
vim.keymap.set("n", "<Leader>r", "<Plug>(toggle-lsp-diag-vtext)", {})
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
