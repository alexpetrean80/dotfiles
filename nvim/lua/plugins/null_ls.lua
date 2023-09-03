return {
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "williamboman/mason.nvim", "nvim-lua/plenary.nvim" },
		lazy = false,
		config = function()
			local null_ls = require("null-ls")

			local formatting = null_ls.builtins.formatting

			local diagnostics = null_ls.builtins.diagnostics
			local code_actions = null_ls.builtins.code_actions

			null_ls.setup({
				debug = false,
				sources = {
					formatting.gofmt,
					formatting.goimports,
					formatting.goimports_reviser,
					formatting.stylua,
					formatting.prismaFmt,
					formatting.black.with({
						prefer_local = true,
						cwd = function(params)
							-- return vim.fn.fnamemodify(params.bufname, ":h")
							return params.root:match("sw-digilent-cloud")
						end,
					}),
					formatting.sql_formatter,
					formatting.gdformat,
					formatting.isort,
					formatting.prettier.with({
						prefer_local = "node_modules/.bin/prettier",
					}),
					diagnostics.ansiblelint,
					diagnostics.luacheck,
					diagnostics.dotenv_linter,
					diagnostics.editorconfig_checker,
					diagnostics.flake8.with({
						prefer_local = true,
						cwd = function(params)
							return vim.fn.fnamemodify(params.bufname, ":h")
						end,
					}),
					diagnostics.eslint.with({
						prefer_local = "node_modules/.bin/eslint",
					}),
					diagnostics.gitlint,
					diagnostics.gdlint,
					diagnostics.golangci_lint,
					diagnostics.gospel,
					code_actions.eslint.with({
						prefer_local = "node_modules/.bin/prettier",
					}),
					code_actions.gomodifytags,
					code_actions.refactoring,
					code_actions.shellcheck,
					-- require("typescript.extensions.null-ls.code-actions"),
				},
				root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git", "pyproject.toml"),
			})
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = {
					-- diagnostics
					"ansible-lint",
					"cmakelang",
					"cmakelint",
					"cpplint",
					"editorconfig-checker",
					"eslint",
					"flake8",
					"gdtoolkit",
					"golangci_lint",
					"jsonlint",
					"luacheck",
					"markdownlint",
					"shellcheck",
					"yamllint",
					-- formatters
					"black",
					"clang-format",
					"gdtoolkit",
					"gofumpt",
					"goimports",
					"isort",
					"prettier",
					"shfmt",
					"stylua",
					"yamlfmt",
				},
				automatic_installation = true,
			})
		end,
	},
}
