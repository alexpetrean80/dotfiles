return {
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
        -- lsp
        "bashls",
        "clangd",
        "cmake",
        "cssls",
        "dockerls",
        "docker_compose_language_service",
        "gopls",
        "helm-ls",
        "html",
        "jsonls",
        "lua_ls",
        "marksman",
        "pyright",
        "sqlls",
        "taplo",
        "tsserver",
        -- formatters
        "goimports",
        "isort",
        "stylua",
        "shellcheck",
        "prettier",
        "shfmt",
        -- linters
        "editorconfig-checker",
        "luacheck",
        "hadolint",
        "gitlint",
        "eslint",
        "jq",
        "flake8",
        "black",
        "isort",
        -- "yamllint",
        "golangci-lint",
        "gomodifytags"
      },
    })
  end,
}
