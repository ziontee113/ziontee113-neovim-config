vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'ellisonleao/gruvbox.nvim'

  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { 'nvim-lua/plenary.nvim' }
  }

  use {
      'kyazdani42/nvim-tree.lua',
      requires = {
          'kyazdani42/nvim-web-devicons'
      },
      tag = 'nightly'
  }
end)
