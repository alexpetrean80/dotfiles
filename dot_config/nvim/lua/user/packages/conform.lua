local M = {}

function M.setup()
    vim.pack.add({
        { src = "https://github.com/stevearc/conform.nvim" },
    })

    require("conform").setup({
        formatters_by_ft = {
            lua = { "stylua" },
            go = { "gofmt", "golines", "goimports" },
            json = { "prettier", "prettierd" },
            javascript = { "prettier", "prettierd" },
            typescript = { "prettier", "prettierd" },
            python = { "isort", "black" },
        },
    })
end

return M
