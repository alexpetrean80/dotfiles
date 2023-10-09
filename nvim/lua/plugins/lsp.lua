return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      {
        "creativenull/efmls-configs-nvim",
        version = "v1.x.x",
      },
    },
    config = function()
      local lsp = require("lsp-zero").preset({})

      lsp.on_attach(function(_, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
      end)

      local shellcheck = require("efmls-configs.linters.shellcheck")
      local stylelint = require("efmls-configs.linters.stylelint")
      local prettier = require("efmls-configs.formatters.prettier")
      local shfmt = require("efmls-configs.formatters.shfmt")
      local cpplint = require("efmls-configs.linters.cpplint")
      local clang_format = require("efmls-configs.formatters.clang_format")
      local hadolint = require("efmls-configs.linters.hadolint")
      local gitlint = require("efmls-configs.linters.gitlint")
      local golangci_lint = require("efmls-configs.linters.golangci_lint")
      local gofmt = require("efmls-configs.formatters.gofmt")
      local goimports = require("efmls-configs.formatters.goimports")
      local eslint = require("efmls-configs.linters.eslint")
      local eslint_fmt = require("efmls-configs.formatters.eslint")
      local jq = require("efmls-configs.linters.jq")
      local luacheck = require("efmls-configs.linters.luacheck")
      local stylua = require("efmls-configs.formatters.stylua")
      local flake8 = require("efmls-configs.linters.flake8")
      local black = require("efmls-configs.formatters.black")
      local isort = require("efmls-configs.formatters.isort")
      local prettier_eslint = require("efmls-configs.formatters.prettier_eslint")
      local ansible_lint = require("efmls-configs.linters.ansible_lint")
      local yamllint = require("efmls-configs.linters.yamllint")

      local efm_langs = {
        bash = { shellcheck, shfmt },
        c = { cpplint, clang_format },
        cpp = { cpplint, clang_format },
        css = { stylelint, prettier },
        docker = { hadolint },
        gitcommit = { gitlint },
        go = {
          -- golangci_lint,
          gofmt,
          goimports,
        },
        html = { prettier },
        javascript = { eslint, eslint_fmt, prettier },
        json = { jq, prettier },
        lua = { luacheck, stylua },
        python = { flake8, black, isort },
        typescript = { eslint, eslint_fmt, prettier, prettier_eslint },
        yaml = { ansible_lint, yamllint, prettier },
      }

      require("lspconfig").efm.setup(vim.tbl_extend("force", {
        filetypes = vim.tbl_keys(efm_langs),
        settings = {
          rootMarkers = { ".git/" },
          languages = efm_langs,
        },
        init_options = {
          documentFormatting = true,
          documentRangeFormatting = true,
        },
      }, {}))

      lsp.setup()
    end,
  },

  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").on_attach({})
    end,
  },
}
