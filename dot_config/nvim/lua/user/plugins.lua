local M = {}

function M.setup()
    M.install()
    M.setup_conform()
    M.setup_mini()
    M.setup_luasnip()
    M.setup_blink()
    M.setup_go_nvim()
    M.setup_mason()
    M.setup_which_key()

    vim.cmd('let test#strategy = "neovim_sticky"')

    require("helm-ls").setup()

    require("neotest").setup({
        adapters = {
            require("neotest-golang")(),
        },
    })
    require("lspsaga").setup({
        symbol_in_winbar = {
            enable = true,
        },
        implement = {
            enable = true,
        },
        ui = {
            border = "none",
            code_action = " ",
        },
    })
end

function M.install()
    vim.pack.add({
        { src = "https://github.com/folke/which-key.nvim" },
        { src = "https://github.com/nvim-neotest/nvim-nio" },
        { src = "https://github.com/nvim-lua/plenary.nvim" },
        { src = "https://github.com/antoinemadec/FixCursorHold.nvim" },
        { src = "https://github.com/nvim-neotest/neotest" },
        { src = "https://github.com/fredrikaverpil/neotest-golang" },
        {
            src = "https://github.com/echasnovski/mini.nvim",
            version = "main",
        },
        {
            src = "https://github.com/nvim-treesitter/nvim-treesitter",
            version = "master",
        },
        { src = "https://github.com/neovim/nvim-lspconfig" },
        {
            src = "https://github.com/catppuccin/nvim",
            name = "catppuccin",
        },
        { src = "https://github.com/HiPhish/rainbow-delimiters.nvim" },
        { src = "https://github.com/vim-test/vim-test" },
        { src = "https://github.com/f-person/git-blame.nvim" },

        { src = "https://github.com/stevearc/conform.nvim" },
        { src = "https://github.com/L3MON4D3/LuaSnip" },
        { src = "https://github.com/rafamadriz/friendly-snippets" },
        {
            src = "https://github.com/Saghen/blink.cmp",
            version = vim.version.range("1.*"),
        },
        { src = "https://github.com/mfussenegger/nvim-dap" },
        { src = "https://github.com/leoluz/nvim-dap-go" },
        { src = "https://github.com/igorlfs/nvim-dap-view" },
        { src = "https://github.com/theHamsta/nvim-dap-virtual-text" },

        { src = "https://github.com/ray-x/go.nvim" },
        { src = "https://github.com/ray-x/guihua.lua" },
        { src = "https://github.com/nvimdev/lspsaga.nvim" },
        { src = "https://github.com/mason-org/mason.nvim" },
        { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
        { src = "https://github.com/qvalentin/helm-ls.nvim" },
    })
end

function M.setup_mini()
    require("mini.starter").setup()
    require("mini.statusline").setup()
    require("mini.files").setup()
    require("mini.pick").setup()
    require("mini.pairs").setup()
    require("mini.surround").setup()
    require("mini.icons").setup()
    require("mini.indentscope").setup()
    require("mini.move").setup()
    require("mini.notify").setup()
    require("mini.extra").setup()
end

function M.setup_luasnip()
    require("luasnip").config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
        enable_autosnippets = true,
    })
    require("luasnip.loaders.from_vscode").lazy_load()
end

function M.setup_blink()
    require("blink.cmp").setup({
        keymap = {
            preset = nil,
            ["<Tab>"] = { "select_next", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },
            ["<CR>"] = { "accept", "fallback" },
        },
        completion = {
            documentation = { auto_show = true },
            list = { selection = { preselect = false } },
            trigger = {
                show_in_snippet = false,
            },
        },
    })
end

function M.setup_conform()
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

function M.setup_go_nvim()
    require("go").setup()

    vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
            require("go.format").goimports()
        end,
        group = format_sync_grp,
    })

    vim.api.nvim_create_autocmd("FileType", {
        pattern = "go",
        callback = function(ev)
            local opts = { buffer = ev.buf, silent = true }
            vim.keymap.set("n", "<leader>lg", "<cmd>GoFmt<cr>", vim.tbl_extend("force", opts, { desc = "Go Format" }))
            vim.keymap.set(
                "n",
                "<leader>lI",
                "<cmd>GoImports<cr>",
                vim.tbl_extend("force", opts, { desc = "Go Imports" })
            )
            vim.keymap.set(
                "n",
                "<leader>lA",
                "<cmd>GoAddTag<cr>",
                vim.tbl_extend("force", opts, { desc = "Go Add Tags" })
            )
            vim.keymap.set(
                "n",
                "<leader>lR",
                "<cmd>GoRmTag<cr>",
                vim.tbl_extend("force", opts, { desc = "Go Remove Tags" })
            )
            vim.keymap.set(
                "n",
                "<leader>ls",
                "<cmd>GoFillStruct<cr>",
                vim.tbl_extend("force", opts, { desc = "Fill Struct" })
            )
            vim.keymap.set("n", "<leader>le", "<cmd>GoIfErr<cr>", vim.tbl_extend("force", opts, { desc = "If Err" }))
            vim.keymap.set("n", "<leader>lc", "<cmd>GoCmt<cr>", vim.tbl_extend("force", opts, { desc = "Comment" }))
        end,
    })
end

function M.setup_mason()
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
end

function M.setup_which_key()
    require("which-key").setup({
        preset = "helix",
        delay = 0,
        show_help = false,
        show_keys = true,
        icons = {
            mappings = false,
        },
        win = {
            border = "none",
        },
        spec = {
            { "<leader>b", group = "Buffers", mode = "n" },
            { "<leader>g", group = "Git", mode = "n" },
            { "<leader>d", group = "Debug", mode = "n" },
            { "<leader>l", group = "LSP", mode = "n" },
            { "<leader>t", group = "Testing", mode = "n" },
        },
    })
end

return M
