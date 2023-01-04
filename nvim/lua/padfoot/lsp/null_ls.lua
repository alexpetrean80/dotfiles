local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	sources = {
        formatting.gofmt,
        formatting.goimports,
        formatting.goimports_reviser,
		formatting.stylua,
		formatting.black,
		formatting.isort,
		formatting.prettier,
		diagnostics.flake8,
		diagnostics.eslint,
        diagnostics.golanci_lint,
        code_actions.gomodifytags,
        -- code_actions.refactoring,
        code_actions.shellcheck
	},
})
