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
		"stevearc/dressing.nvim",
		lazy = true,
		init = function()
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
		end,
	},
	{
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("noice").setup({
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
					signature = {
						enabled = false,
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = false, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = true, -- add a border to hover docs and signature help
				},
			})
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
			vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
			vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
			vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
			vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
			require("neo-tree").setup({
				close_if_last_window = false,
				popup_border_style = "rounded",
				enable_git_status = true,
				enable_diagnostics = true,
				open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
				sort_case_insensitive = false,
				sort_function = function(a, b)
					if a.type == b.type then
						return a.path < b.path
					end
					return a.type < b.type
				end,
				default_component_configs = {
					container = {
						enable_character_fade = true,
					},
					indent = {
						indent_size = 2,
						padding = 1,
						with_markers = true,
						indent_marker = "│",
						last_indent_marker = "└",
						highlight = "NeoTreeIndentMarker",
						with_expanders = nil,
						expander_collapsed = "",
						expander_expanded = "",
						expander_highlight = "NeoTreeExpander",
					},
					icon = {
						folder_closed = "",
						folder_open = "",
						folder_empty = "ﰊ",
						default = "*",
						highlight = "NeoTreeFileIcon",
					},
					modified = {
						symbol = "[+]",
						highlight = "NeoTreeModified",
					},
					name = {
						trailing_slash = false,
						use_git_status_colors = true,
						highlight = "NeoTreeFileName",
					},
					git_status = {
						symbols = {
							added = "",
							modified = "",
							deleted = "✖",
							renamed = "",
							untracked = "",
							ignored = "",
							unstaged = "",
							staged = "",
							conflict = "",
						},
					},
				},
				window = {
					position = "left",
					width = 40,
					mapping_options = {
						noremap = true,
						nowait = true,
					},
					mappings = {
						["<space>"] = {
							"toggle_node",
							nowait = false,
						},
						["<2-LeftMouse>"] = "open",
						["<cr>"] = "open",
						["<esc>"] = "revert_preview",
						["P"] = { "toggle_preview", config = { use_float = true } },
						["l"] = "focus_preview",
						["S"] = "open_split",
						["s"] = "open_vsplit",
						["t"] = "open_tabnew",
						["w"] = "open_with_window_picker",
						["C"] = "close_node",
						["z"] = "close_all_nodes",
						["a"] = {
							"add",

							config = {
								show_path = "none",
							},
						},
						["A"] = "add_directory",
						["d"] = "delete",
						["r"] = "rename",
						["y"] = "copy_to_clipboard",
						["x"] = "cut_to_clipboard",
						["p"] = "paste_from_clipboard",
						["c"] = "copy",
						["m"] = "move",
						["q"] = "close_window",
						["R"] = "refresh",
						["?"] = "show_help",
						["<"] = "prev_source",
						[">"] = "next_source",
					},
				},
				nesting_rules = {},
				filesystem = {
					filtered_items = {
						visible = false,
						hide_dotfiles = false,
						hide_gitignored = false,
						hide_hidden = false,
					},
					follow_current_file = true,
					group_empty_dirs = false,
					hijack_netrw_behavior = "open_default",
					use_libuv_file_watcher = true,
					window = {
						mappings = {
							["<bs>"] = "navigate_up",
							["."] = "set_root",
							["H"] = "toggle_hidden",
							["/"] = "fuzzy_finder",
							["D"] = "fuzzy_finder_directory",
							["#"] = "fuzzy_sorter",
							["f"] = "filter_on_submit",
							["<c-x>"] = "clear_filter",
							["[g"] = "prev_git_modified",
							["]g"] = "next_git_modified",
						},
					},
				},
				buffers = {
					follow_current_file = false,
					group_empty_dirs = true,
					show_unloaded = true,
					window = {
						mappings = {
							["bd"] = "buffer_delete",
							["<bs>"] = "navigate_up",
							["."] = "set_root",
						},
					},
				},
				git_status = {
					window = {
						position = "float",
						mappings = {
							["A"] = "git_add_all",
							["gu"] = "git_unstage_file",
							["ga"] = "git_add_file",
							["gr"] = "git_revert_file",
							["gc"] = "git_commit",
							["gp"] = "git_push",
							["gg"] = "git_commit_and_push",
						},
					},
				},
			})
		end,
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
