-- Packer
require("packer.packer-config")

-- Mappings
require("mappings.basic-mappings")

-- Settings
require("settings.basic-settings")
require("settings.system-settings")
require("settings.colorscheme")

-- File Navigation
require("plugins.telescope.telescope-config")
require("plugins.neo-tree.neo-tree-config")

-- Intelligent Code Interaction
require("lsp-config")
require("null-ls-config")
require("tree-sitter-config")
require("luasnip-config")
require("cmp-config")

-- Additional Highlighting
require("plugins.colorizer")
