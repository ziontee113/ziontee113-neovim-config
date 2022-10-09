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

-- Mappings
require("mappings.basic-mappings")
require("mappings.paragraph-jumping")

-- Additional Highlighting
require("plugins.colorizer")
require("plugins.surround")

-- Workspace Management
require("plugins.tabby")
require("plugins.sj")

-- Yank Management
require("plugins.neoclip")

-- Mini.nvim
require("mini.ai").setup() -- targets.vim

-- Custom Scripts
require("global-variables")
require("custom-scripts")
