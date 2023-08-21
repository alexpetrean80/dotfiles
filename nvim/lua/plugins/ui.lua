return {
	{ "folke/neodev.nvim" },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
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
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			-- char = "▏",
			char = "│",
			filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
			show_trailing_blankline_indent = false,
			show_current_context = false,
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "catppuccin/nvim" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "catppuccin",
					component_separators = " ",
					section_separators = { left = "", right = "" },
				},
			})
		end,
	},
	{
		"kosayoda/nvim-lightbulb",
		opts = {
			sign = {
				enabled = true,
				-- Priority of the gutter sign
				priority = 20,
			},
			status_text = {
				enabled = true,
				-- Text to provide when code actions are available
				text = "status_text",
				-- Text to provide when no actions are available
				text_unavailable = "",
			},
			autocmd = {
				enabled = true,
				-- see :help autocmd-pattern
				pattern = { "*" },
				-- see :help autocmd-events
				events = { "CursorHold", "CursorHoldI", "LspAttach" },
			},
		},
	},
	{
		"utilyre/barbecue.nvim",
		event = { "BufReadPost" },
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			theme = "auto",
			include_buftypes = { "" },
			exclude_filetypes = { "gitcommit", "Trouble", "toggleterm" },
			show_modified = false,
			kinds = {
				File = "", -- File
				Module = "", -- Module
				Namespace = "", -- Namespace
				Package = "", -- Package
				Class = "", -- Class
				Method = "", -- Method
				Property = "", -- Property
				Field = "", -- Field
				Constructor = "", -- Constructor
				Enum = "", -- Enum
				Interface = "", -- Interface
				Function = "", -- Function
				Variable = "", -- Variable
				Constant = "", -- Constant
				String = "", -- String
				Number = "", -- Number
				Boolean = "◩", -- Boolean
				Array = "", -- Array
				Object = "", -- Object
				Key = "", -- Key
				Null = "ﳠ", -- Null
				EnumMember = "", -- EnumMember
				Struct = "", -- Struct
				Event = "", -- Event
				Operator = "", -- Operator
				TypeParameter = "", -- TypeParameter
				Macro = "", -- Macro
			},
		},
	},
}
