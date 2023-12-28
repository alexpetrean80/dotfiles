return {
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			local wc = require("which-key")

			wc.register({
				b = { name = "Buffers" },
				l = { name = "LSP" },
			}, {
				mode = "n",
				prefix = "<leader>",
				buffer = nil,
				silent = true,
				noremap = true,
				nowait = false,
			})

			wc.setup({
				window = { margin = { 1, 0, 0, 0.8 }, border = "single" },
				layout = { height = { min = 4, max = 150 }, align = "left" },
			})
		end,
	},
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {
			show_dirname = false,
			show_basename = true,
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				presets = {
					command_palette = true,
					inc_rename = true,
					lsp_doc_border = true,
					bottom_search = false,
					long_message_to_split = true,
					indent_blankline = {
						enabled = true,
						scope_color = "lavender",
						colored_indent_levels = false,
					},
				},
			})
		end,
	},
	{
		"echasnovski/mini.files",
		version = false,
		config = function()
			require("mini.files").setup()
		end,
	},
}
