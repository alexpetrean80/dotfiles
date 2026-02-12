local M = {}

function M.setup()
    vim.pack.add({
        { src = "https://github.com/mason-org/mason.nvim" },
        { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
        { src = "https://github.com/qvalentin/helm-ls.nvim" },
    })
    require("mason").setup()
    require("mason-lspconfig").setup({
        automatic_enable = true,
        ensure_installed = {
            "clangd",
            "gopls",
            "gopls",
            "helm_ls",
            "jsonls",
            "lua_ls",
            "marksman",
            "ruff",
            "spectral",
            "sqls",
            "stylua",
            "terraformls",
            "ts_ls",
            "vtsls",
            "yamlls",
        },
    })
    require("helm-ls").setup()
end

return M
