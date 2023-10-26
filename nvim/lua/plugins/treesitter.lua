return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false, -- last release is way too old and doesn"t work on Windows
		build = ":TSUpdate",
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				init = function()
					-- PERF: no need to load the plugin, if we only need its queries for mini.ai
					local plugin = require("lazy.core.config").spec.plugins["nvim-treesitter"]
					local opts = require("lazy.core.plugin").values(plugin, "opts", false)
					local enabled = false
					if opts.textobjects then
						for _, mod in ipairs({
							"move",
							"select",
							"swap",
							"lsp_interop",
						}) do
							if opts.textobjects[mod] and opts.textobjects[mod].enable then
								enabled = true
								break
							end
						end
					end
					if not enabled then
						require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
					end
				end,
			},
			{
				"nvim-treesitter/nvim-treesitter-context",
				config = function()
					require("treesitter-context").setup({
						enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
						max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
						min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
						line_numbers = true,
						multiline_threshold = 20, -- Maximum number of lines to show for a single context
						trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
						mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
						-- Separator between context and content. Should be a single character string, like '-'.
						-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
						separator = nil,
						zindex = 20, -- The Z-index of the context window
						on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
					})
				end,
			},
			"HiPhish/nvim-ts-rainbow2",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				-- A list of parser names, or "all"
				ensure_installed = "all",
				ignore_install = { "hoon" },
				highlight = { enable = true, use_languagetree = true },
				indent = { enable = true },
				autotag = { enable = true },
				context_commentstring = { enable = true, enable_autocmd = false },
				refactor = {
					highlight_definitions = { enable = true },
					highlight_current_scope = { enable = true },
				},
				rainbow = {
					enable = true,
					query = "rainbow-parens",
					strategy = require("ts-rainbow").strategy.global,
				},
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-ts-autotag").setup({})
		end,
	},
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("refactoring").setup({
				prompt_func_return_type = {
					go = true,
					java = true,

					cpp = true,
					c = true,
					h = true,
					hpp = true,
					cxx = true,
				},
				prompt_func_param_type = {
					go = true,
					java = true,

					cpp = true,
					c = true,
					h = true,
					hpp = true,
					cxx = true,
				},
				printf_statements = {},
				print_var_statements = {},
			})
		end,
	},
}
