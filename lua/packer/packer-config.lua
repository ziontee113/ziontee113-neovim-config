vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer
	use("wbthomason/packer.nvim")

	-- Color Scheme
	use("ellisonleao/gruvbox.nvim")

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})

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
	use({ "williamboman/mason.nvim" })
	use("neovim/nvim-lspconfig")
	use("simrat39/rust-tools.nvim")
	use("lvimuser/lsp-inlayhints.nvim")
	use("jose-elias-alvarez/typescript.nvim")

	-- Code Formatting
	use("jose-elias-alvarez/null-ls.nvim")

	-- TreeSitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/playground")
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use("p00f/nvim-ts-rainbow")

	-- LuaSnip
	use("L3MON4D3/LuaSnip")

	-- CMP
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-path")

	-- Terminal
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("plugins.toggle-term")
		end,
	})

	-- Additional Highlighter
	use("NvChad/nvim-colorizer.lua")

	-- Windows Animation
	use({
		"anuvyklack/windows.nvim",
		requires = {
			"anuvyklack/middleclass",
			"anuvyklack/animation.nvim",
		},
		config = function()
			vim.o.winwidth = 10
			vim.o.winminwidth = 10
			vim.o.equalalways = false
			require("windows").setup()
		end,
	})

	-- Tabby
	use("nanozuki/tabby.nvim")

	-- Color Picker
	use({
		"~/.config/nvim-custom-plugin/color-picker/",
		cmd = { "PickColor", "PickColorInsert" },
		config = function()
			require("color-picker").setup({
				["icons"] = { "ﱢ", "" },
				["border"] = "rounded",
				["keymap"] = {
					["Q"] = "<Plug>ColorPickerCloseColorPicker",
					["U"] = "<Plug>Slider5Decrease",
					["O"] = "<Plug>Slider5Increase",
				},
			})
		end,
	})

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- Experimental
	use("woosaaahh/sj.nvim")
end)
