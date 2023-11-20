return {
  "nvimtools/none-ls.nvim",
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
        formatting.stylua,
        formatting.black.with({
          prefer_local = true,
          cwd = function(params)
            -- return vim.fn.fnamemodify(params.bufname, ":h")
            return params.root:match("sw-digilent-cloud")
          end,
        }),
        formatting.isort,
        formatting.prettier.with({
          prefer_local = "node_modules/.bin/prettier",
        }),
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
        -- diagnostics.gospel,
        code_actions.eslint.with({
          prefer_local = "node_modules/.bin/prettier",
        }),
        code_actions.gomodifytags,
        code_actions.impl,
        code_actions.refactoring,
        code_actions.shellcheck,
      },
      root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git", "pyproject.toml"),
    })
  end,
}
