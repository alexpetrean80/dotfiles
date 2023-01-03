require("packer").startup({
	function(use)
		use("wbthomason/packer.nvim")
        use("ellisonleao/gruvbox.nvim")
		-- lsp
		use("williamboman/mason.nvim")
		use("williamboman/mason-lspconfig.nvim")
		use("neovim/nvim-lspconfig")
		use("jose-elias-alvarez/null-ls.nvim")
		use({
			"ray-x/lsp_signature.nvim",
			event = "BufRead",
			config = function()
				require("lsp_signature").on_attach()
			end,
		})
		use({
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
			config = function()
				require("trouble").setup()
			end,
		})

		-- git stuff
		use("lewis6991/gitsigns.nvim")
		use({
			"f-person/git-blame.nvim",
			event = "BufRead",
			config = function()
				vim.cmd("highlight default link gitblame SpecialComment")
				vim.g.gitblame_enabled = 0
			end,
		})
        use("tpope/vim-fugitive")

		-- completion
		use("hrsh7th/nvim-cmp")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-path")
		use("saadparwaiz1/cmp_luasnip")
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-nvim-lua")
		use("L3MON4D3/LuaSnip")
		use("rafamadriz/friendly-snippets")

		use("machakann/vim-sandwich")
		use({ "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" } })
		use({
			"akinsho/bufferline.nvim",
			tag = "v3.*",
			requires = "nvim-tree/nvim-web-devicons",
		})
		use("windwp/nvim-autopairs")
		use("lukas-reineke/indent-blankline.nvim")
		use("RRethy/vim-illuminate")
		use("numToStr/Comment.nvim")
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		use("JoosepAlviste/nvim-ts-context-commentstring")
		use("p00f/nvim-ts-rainbow")
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		})
		use({ "navarasu/onedark.nvim", as = "onedark" })
		use({
			"nvim-telescope/telescope.nvim",
			tag = "0.1.0",
			requires = { { "nvim-lua/plenary.nvim" } },
		})
		use({
			"folke/which-key.nvim",
			config = function()
				require("which-key").setup({
					-- your configuration comes here
					-- or leave it empty to use the default settings
					-- refer to the configuration section below
				})
			end,
		})
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
