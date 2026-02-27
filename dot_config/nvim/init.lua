-- [[ SECTION: Options ]]
vim.opt.completeopt = { "menu", "menuone", "noinsert", "noselect", "popup", "preview" }
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

vim.opt.winborder = "none"
vim.opt.wrap = true
vim.opt.tabstop = 8
vim.opt.swapfile = false
vim.opt.laststatus = 3
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.backup = false
vim.opt.autoread = true

vim.o.clipboard = "unnamedplus"

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "  ",
            [vim.diagnostic.severity.WARN] = "  ",
            [vim.diagnostic.severity.HINT] = "  ",
            [vim.diagnostic.severity.INFO] = "  ",
        },
    },
})

-- [[ SECTION: Plugins ]]
vim.pack.add({
    { src = "https://github.com/folke/which-key.nvim" },
    { src = "https://github.com/nvim-neotest/nvim-nio" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/antoinemadec/FixCursorHold.nvim" },
    { src = "https://github.com/nvim-neotest/neotest" },
    { src = "https://github.com/fredrikaverpil/neotest-golang" },
    { src = "https://github.com/echasnovski/mini.nvim", version = "main" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
    { src = "https://github.com/HiPhish/rainbow-delimiters.nvim" },
    { src = "https://github.com/vim-test/vim-test" },
    { src = "https://github.com/f-person/git-blame.nvim" },
    { src = "https://github.com/stevearc/conform.nvim" },
    { src = "https://github.com/L3MON4D3/LuaSnip" },
    { src = "https://github.com/rafamadriz/friendly-snippets" },
    { src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("1.*") },
    { src = "https://github.com/mfussenegger/nvim-dap" },
    { src = "https://github.com/leoluz/nvim-dap-go" },
    { src = "https://github.com/igorlfs/nvim-dap-view" },
    { src = "https://github.com/theHamsta/nvim-dap-virtual-text" },
    { src = "https://github.com/ray-x/go.nvim" },
    { src = "https://github.com/ray-x/guihua.lua" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/qvalentin/helm-ls.nvim" },
})

-- [[ SECTION: Plugin setup ]]
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

require("luasnip").config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
})
require("luasnip.loaders.from_vscode").lazy_load()

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
        trigger = { show_in_snippet = false },
    },
})

require("go").setup()

require("mason").setup()
require("mason-lspconfig").setup({
    automatic_enable = true,
    ensure_installed = {
        "clangd",
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

require("which-key").setup({
    preset = "helix",
    delay = 0,
    show_help = false,
    show_keys = true,
    icons = { mappings = false },
    win = { border = "none" },
    spec = {
        { "<leader>b", group = "Buffers", mode = "n" },
        { "<leader>g", group = "Git", mode = "n" },
        { "<leader>d", group = "Debug", mode = "n" },
        { "<leader>l", group = "LSP", mode = "n" },
        { "<leader>t", group = "Testing", mode = "n" },
    },
})

require("helm-ls").setup()
require("neotest").setup({
    adapters = { require("neotest-golang")() },
})

-- [[ SECTION: Autocmds ]]
local augroup = vim.api.nvim_create_augroup("UserAutoCmds", { clear = true })
local format_sync_grp = vim.api.nvim_create_augroup("FormatSync", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true)
        end
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("TermClose", {
    group = augroup,
    callback = function()
        if vim.v.event.status == 0 then
            vim.api.nvim_buf_delete(0, {})
        end
    end,
})

vim.api.nvim_create_autocmd("TermOpen", {
    group = augroup,
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.signcolumn = "no"
    end,
})

vim.api.nvim_create_autocmd("VimResized", {
    group = augroup,
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

vim.api.nvim_create_autocmd("VimEnter", {
    group = augroup,
    callback = function()
        vim.cmd("TSEnable highlight")
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    group = format_sync_grp,
    callback = function()
        require("go.format").goimports()
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    group = augroup,
    callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        local km = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
        end
        km("n", "<leader>lg", "<cmd>GoFmt<cr>", "Go Format")
        km("n", "<leader>lI", "<cmd>GoImports<cr>", "Go Imports")
        km("n", "<leader>lA", "<cmd>GoAddTag<cr>", "Go Add Tags")
        km("n", "<leader>lR", "<cmd>GoRmTag<cr>", "Go Remove Tags")
        km("n", "<leader>ls", "<cmd>GoFillStruct<cr>", "Fill Struct")
        km("n", "<leader>le", "<cmd>GoIfErr<cr>", "If Err")
        km("n", "<leader>lc", "<cmd>GoCmt<cr>", "Comment")
    end,
})

-- [[ SECTION: LSP ]]
vim.lsp.enable({ "lua_ls", "gopls", "ts_ls", "sqls", "terraformls" })

vim.lsp.config("lua_ls", {
    settings = {
        Lua = { hint = { enable = true } },
    },
})

vim.lsp.config("gopls", {
    settings = {
        gopls = {
            hints = {
                rangeVariableTypes = true,
                parameterNames = true,
                constantValues = true,
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                functionTypeParameters = true,
            },
        },
    },
})

local ts_inlay_hints = {
    includeInlayParameterNameHints = "all",
    includeInlayParameterNameHintsWhenArgumentMatchesName = true,
    includeInlayFunctionParameterTypeHints = true,
    includeInlayVariableTypeHints = true,
    includeInlayVariableTypeHintsWhenTypeMatchesName = true,
    includeInlayPropertyDeclarationTypeHints = true,
    includeInlayFunctionLikeReturnTypeHints = true,
    includeInlayEnumMemberValueHints = true,
}
vim.lsp.config("ts_ls", {
    settings = {
        typescript = { inlayHints = ts_inlay_hints },
        javascript = { inlayHints = ts_inlay_hints },
    },
})

-- [[ SECTION: Keymaps ]]
local function keymap(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { desc = desc, silent = true })
end

local mini_pick = require("mini.pick")
local mini_files = require("mini.files")
local mini_extra = require("mini.extra")

keymap("n", "<leader>\\", "<cmd>vsplit<CR>", "Vertical split")
keymap("n", "<leader><leader>", mini_pick.builtin.files, "Files")
keymap("n", "<leader>e", mini_files.open, "Explorer")
keymap("n", "<leader>/", mini_pick.builtin.grep_live, "Live grep")

local conform = require("conform")
keymap("n", "<leader>r", vim.lsp.buf.rename, "Rename")
keymap("n", "<leader>la", vim.lsp.buf.code_action, "Code Actions")
keymap("n", "<leader>lf", conform.format, "Format")
keymap("n", "<leader>lF", function()
    mini_extra.pickers.lsp({ scope = "workspace_symbol" })
end, "Workspace symbols")
keymap("n", "<leader>ld", vim.lsp.buf.definition, "Go to definition")
keymap("n", "<leader>li", function()
    mini_extra.pickers.lsp({ scope = "implementation" })
end, "Find implementations")
keymap("n", "<leader>lD", vim.lsp.buf.declaration, "Go to declaration")
keymap("n", "<leader>lr", function()
    mini_extra.pickers.lsp({ scope = "references" })
end, "LSP References")
keymap("n", "<leader>lt", vim.lsp.buf.type_definition, "Go to type definition")
keymap("n", "K", vim.lsp.buf.hover, "Hover")
keymap("n", "<leader>xn", vim.diagnostic.goto_next, "Next diagnostic")
keymap("n", "<leader>xp", vim.diagnostic.goto_prev, "Previous diagnostic")
keymap("n", "<leader>xb", function()
    vim.diagnostic.setloclist()
end, "Buffer diagnostics")
keymap("n", "<leader>xx", function()
    vim.diagnostic.setqflist()
end, "Workspace Diagnostics")
keymap("n", "<leader>T", "<cmd>term<CR>i", "Terminal")

keymap("n", "<leader>gg", "<cmd>term lazygit<CR>i", "Lazygit")
keymap("n", "<leader>gp", "<cmd>term gh pr create<CR>i", "Create PR")
keymap("n", "<leader>gW", "<cmd>term gh pr view<CR>i", "View PR (Terminal)")
keymap("n", "<leader>gw", "<cmd>!gh pr view --web<CR>", "View PR (Browser)")
keymap("n", "<leader>gd", "<cmd>term gh dash .<CR>i", "GH dash")

keymap("n", "<leader>bb", mini_pick.builtin.buffers, "Buffers")
keymap("n", "<leader>bn", "<cmd>bnext<CR>", "Next")
keymap("n", "<leader>bp", "<cmd>bprevious<CR>", "Previous")
keymap("n", "<leader>bd", "<cmd>bdelete<CR>", "Delete")

local dap = require("dap")
keymap("n", "<leader>db", dap.toggle_breakpoint, "Toggle Breakpoint")
keymap("n", "<leader>dc", dap.continue, "Continue")
keymap("n", "<leader>di", dap.step_into, "Step Into")
keymap("n", "<leader>do", dap.step_over, "Step Over")
keymap("n", "<leader>dO", dap.step_out, "Step Out")
keymap("n", "<leader>dt", "<cmd>DapViewToggle<CR>", "Toggle View")

keymap("n", "<leader>tn", "<cmd>TestNearest<CR>", "Nearest")
keymap("n", "<leader>tf", "<cmd>TestFile<CR>", "File")
keymap("n", "<leader>ts", "<cmd>TestSuite<CR>", "Suite")
keymap("n", "<leader>tl", "<cmd>TestLast<CR>", "Last")
keymap("n", "<leader>tg", "<cmd>TestVisit<CR>", "Go To Last")

-- [[ SECTION: Finish ]]
vim.cmd('let test#strategy = "neovim_sticky"')
vim.cmd.colorscheme("catppuccin")
