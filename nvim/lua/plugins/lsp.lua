return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      local lsp_zero = require("lsp-zero").preset({})

      lsp_zero.on_attach(function(_, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr, preserve_mappings = false })
      end)

      local lsp = require("lspconfig")
      local lua_opts = lsp_zero.nvim_lua_ls()
      lsp.lua_ls.setup(lua_opts)

      lsp_zero.setup()
    end,
  },
  {
    "smjonas/inc-rename.nvim",
    keys = { { "<leader>r", ":IncRename ", desc = "Rename" } },
    config = function()
      require("inc_rename").setup()
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").on_attach({})
    end,
  },
  { "towolf/vim-helm" },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>le", "<cmd>Trouble document_diagnostics<CR>",  desc = "Document diagnostics" },
      { "<leader>lE", "<cmd>Trouble workspace_diagnostics<CR>", desc = "Workspace diagnostics" },
      { "<leader>lq", "<cmd>Trouble quickfix<CR>",              desc = "Quickfix" },
      { "<leader>lr", "<cmd>Trouble lsp_references<CR>",        desc = "References" },
      { "<leader>ld", "<cmd>Trouble lsp_definitions<CR>",       desc = "Definitions" },
      { "<leader>lt", "<cmd>Trouble lsp_type_definitions<CR>",  desc = "Type definitions" },
    },
    opts = {},
  },
  {
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
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason-tool-installer").setup({
        auto_update = true,
        run_on_start = true,
        ensure_installed = {
          "bashls",
          "black",
          "clang-format",
          "clangd",
          "cmake",
          "cpplint",
          "cssls",
          "docker_compose_language_service",
          "dockerls",
          "editorconfig-checker",
          "eslint",
          "flake8",
          "gitlint",
          "goimports",
          "golangci-lint",
          "golines",
          "gomodifytags",
          "gopls",
          "hadolint",
          "helm_ls",
          "html",
          "isort",
          "jq",
          "jsonls",
          "lua_ls",
          "luacheck",
          "marksman",
          "ocamllsp",
          "prettier",
          "pyright",
          "rust-analyzer",
          "shellcheck",
          "shfmt",
          "sqlls",
          "stylelint",
          "stylua",
          "taplo",
          "tsserver",
          "yamllint",
        },
      })
    end,
  },
}
