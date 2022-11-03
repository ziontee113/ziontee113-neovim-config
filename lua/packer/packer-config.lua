vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer
	use("wbthomason/packer.nvim")

	-- Color Scheme
	use("ellisonleao/gruvbox.nvim")

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
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
		cmd = {
			"NeoTreeRevealToggle",
			"NeoTreeFloatToggle",
		},
		config = function()
			require("plugins.neo-tree.neo-tree-config")
		end,
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
	use("nvim-treesitter/nvim-treesitter-textobjects")

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

	-- Tabby
	use("nanozuki/tabby.nvim")

	-- ======= Utilities ======= --

	-- Syntax Tree Surfer
	use("~/.config/nvim-custom-plugin/syntax-tree-surfer/")

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

	-- Icon Picker
	use("~/.config/nvim-custom-plugin/icon-picker.nvim")

	-- Comments
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- Surround
	use("kylechui/nvim-surround")

	-- Mini
	use("echasnovski/mini.nvim")

	-- Working Directory Changer
	use({
		"notjedi/nvim-rooter.lua",
		config = function()
			require("nvim-rooter").setup()
		end,
	})

	-- Close Buffers
	use({
		"kazhala/close-buffers.nvim",
	})

	-- Todo Comments
	use({
		"folke/todo-comments.nvim",
	})

	-- Notify
	use("rcarriga/nvim-notify")

	-- DevOnDuty Better Variable Highlighting
	use("David-Kunz/markid")

	-- Dressing
	use({ "stevearc/dressing.nvim" })

	----
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- Leap
	use("ggandor/leap.nvim")

	-- Windows.nvim
	use({
		"anuvyklack/windows.nvim",
		requires = {
			"anuvyklack/middleclass",
			"anuvyklack/animation.nvim",
		},
		config = function()
			vim.o.winwidth = 120
			vim.o.winminwidth = 10
			vim.o.equalalways = false
			require("windows").setup()
		end,
	})

	-- GoMove
	use("booperlv/nvim-gomove")

	-- -- SJ.nvim
	-- use({ "woosaaahh/sj.nvim", branch = "feat-multi_wins_search" })

	-- Neotest
	use("nvim-neotest/neotest")
	use("nvim-neotest/neotest-plenary")
end)
