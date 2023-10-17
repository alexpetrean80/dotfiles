return {
	{
		"prichrd/netrw.nvim",
		config = function()
			require("netrw").setup({
				icons = {
					symlink = "",
					directory = "",
					file = "",
				},
				use_devicons = true,
			})
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				integrations = {
					alpha = true,
					gitsigns = true,
					mason = true,
					mini = true,
					neotree = true,
					noice = true,
					cmp = true,
					treesitter_context = true,
					treesitter = true,
					ts_rainbow2 = true,
					telescope = true,
					illuminate = true,
					sandwich = true,
					which_key = true,
				},
			})
		end,
	},
}
