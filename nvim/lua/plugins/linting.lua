return {
  "mfussenegger/nvim-lint",
  commit = "9b6cb72660114e5f188907be0d866a8ca2b0ef23",
  config = function()
    require("lint").linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      python = { "flake8" },
      go = { "golancilint" },
      bash = { "shellcheck" },
      yaml = { "prettier" }
    }
  end,
}
