vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer
    use 'wbthomason/packer.nvim'

    -- Color Scheme
    use 'ellisonleao/gruvbox.nvim'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    -- File Browser
    use({
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    })

    -- LSP
    use { "williamboman/mason.nvim" }
    use 'neovim/nvim-lspconfig'

    -- TreeSitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })
    use 'nvim-treesitter/playground'
    use "windwp/nvim-ts-autotag"
    use "p00f/nvim-ts-rainbow"

    -- LuaSnip
    use "L3MON4D3/LuaSnip"

    -- CMP
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
end)
