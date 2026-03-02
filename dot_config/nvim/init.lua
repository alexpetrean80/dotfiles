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
    { src = "https://github.com/folke/snacks.nvim" },
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
    { src = "https://github.com/f-person/git-blame.nvim" },
    { src = "https://github.com/stevearc/conform.nvim" },
    { src = "https://github.com/L3MON4D3/LuaSnip" },
    { src = "https://github.com/rafamadriz/friendly-snippets" },
    { src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("1.*") },
    { src = "https://github.com/mfussenegger/nvim-dap" },
    { src = "https://github.com/leoluz/nvim-dap-go" },
    { src = "https://github.com/rcarriga/nvim-dap-ui" },
    { src = "https://github.com/theHamsta/nvim-dap-virtual-text" },
    { src = "https://github.com/ray-x/go.nvim" },
    { src = "https://github.com/ray-x/guihua.lua" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/qvalentin/helm-ls.nvim" },
    { src = "https://github.com/olimorris/codecompanion.nvim" },
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
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.icons").setup()
require("mini.git").setup()
require("mini.move").setup()
require("mini.files").setup()

require("snacks").setup({
    animate = { enabled = true },
    bigfile = { enabled = true },
    indent = { enabled = true },
    bufdelete = { enabled = true },
    explorer = { enabled = false },
    gh = { enabled = true },
    git = { enabled = true },
    gitbrowse = { enabled = true },
    keymap = { enabled = true },
    lazygit = { enabled = true },
    notifier = { enabled = true },
    picker = { enabled = true },
    quickfile = { enabled = true },
    rename = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    zen = { enabled = true },
})

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
    snippets = { preset = "luasnip" },
    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {
            lsp = {
                timeout_ms = 3000,
                min_keyword_length = 0,
            },
        },
    },
    completion = {
        keyword = { range = "full" },
        trigger = {
            prefetch_on_insert = true,
            show_in_snippet = false,
        },
        list = {
            selection = { preselect = false },
            max_items = 200,
        },
        accept = { resolve_timeout_ms = 200 },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 300,
        },
        ghost_text = { enabled = true },
        menu = {
            draw = {
                columns = {
                    { "kind_icon" },
                    { "label", "label_description", gap = 1 },
                },
            },
        },
    },
    signature = { enabled = true },
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
        { "<leader>a", group = "AI", mode = "n" },
        { "<leader>z", group = "Zen", mode = "n" },
    },
})

require("helm-ls").setup()

local dap = require("dap")
local dapui = require("dapui")

-- DAP breakpoint signs (Nerd Font icons)
vim.fn.sign_define("DapBreakpoint", { text = "󰑓", texthl = "DapBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define(
    "DapBreakpointCondition",
    { text = "󰘬", texthl = "DapBreakpointCondition", linehl = "", numhl = "" }
)
vim.fn.sign_define("DapLogPoint", { text = "󰒍", texthl = "DapLogPoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "→", texthl = "DapStopped", linehl = "", numhl = "" })
vim.fn.sign_define(
    "DapBreakpointRejected",
    { text = "󰅖", texthl = "DapBreakpointRejected", linehl = "", numhl = "" }
)

dapui.setup()
dap.listeners.before.attach["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.launch["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before["event_terminated"]["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before["event_exited"]["dapui_config"] = function()
    dapui.close()
end

require("neotest").setup({
    adapters = { require("neotest-golang")() },
})

-- CodeCompanion with Cursor ACP
-- Prerequisites: cursor-agent login, then npm install -g @blowmage/cursor-agent-acp
-- Wait for "Cursor" to appear in the chat buffer header before sending messages
require("codecompanion").setup({
    interactions = {
        chat = {
            adapter = "cursor_acp",
        },
    },
    display = {
        action_palette = {
            provider = "snacks",
        },
        chat = {
            window = {
                position = "right",
            },
        },
    },
    adapters = {
        acp = {
            cursor_acp = function()
                return require("codecompanion.adapters").extend("cagent", {
                    name = "cursor_acp",
                    formatted_name = "Cursor",
                    commands = {
                        -- Use npx so the adapter is found even if not globally installed
                        default = { "npx", "--yes", "@blowmage/cursor-agent-acp" },
                    },
                    defaults = {
                        timeout = 60000, -- 60s for slower startup
                    },
                })
            end,
        },
    },
    opts = {
        log_level = "DEBUG", -- Set to "INFO" once working; run :checkhealth codecompanion for log path
    },
})

-- [[ SECTION: Autocmds ]]
local augroup = vim.api.nvim_create_augroup("UserAutoCmds", { clear = true })
local format_sync_grp = vim.api.nvim_create_augroup("FormatSync", { clear = true })

-- Snacks rename integration with mini.files
vim.api.nvim_create_autocmd("User", {
    pattern = "MiniFilesActionRename",
    group = augroup,
    callback = function(event)
        require("snacks").rename.on_rename_file(event.data.from, event.data.to)
    end,
})

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

-- [[ SECTION: LSP ]]
-- Enhanced completion capabilities for blink.cmp (label details, resolve support, etc.)
vim.lsp.config("*", {
    capabilities = require("blink.cmp").get_lsp_capabilities(),
})
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
local Snacks = require("snacks")
local conform = require("conform")

local function keymap(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { desc = desc, silent = true })
end

keymap("n", "<leader>\\", "<cmd>vsplit<CR>", "Vertical split")
Snacks.keymap.set("n", "<leader><leader>", function()
    Snacks.picker.files()
end, { desc = "Files" })
Snacks.keymap.set("n", "<leader>e", function()
    MiniFiles.open()
end, { desc = "Explorer" })
Snacks.keymap.set("n", "<leader>/", function()
    Snacks.picker.grep()
end, { desc = "Grep" })

Snacks.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename", lsp = { method = "textDocument/rename" } })
Snacks.keymap.set(
    "n",
    "<leader>la",
    vim.lsp.buf.code_action,
    { desc = "Code Actions", lsp = { method = "textDocument/codeAction" } }
)
keymap("n", "<leader>lf", conform.format, "Format")
Snacks.keymap.set("n", "<leader>lF", function()
    Snacks.picker.lsp_workspace_symbols()
end, { desc = "Workspace symbols" })
Snacks.keymap.set(
    "n",
    "<leader>ld",
    vim.lsp.buf.definition,
    { desc = "Go to definition", lsp = { method = "textDocument/definition" } }
)
Snacks.keymap.set("n", "<leader>li", function()
    Snacks.picker.lsp_implementations()
end, { desc = "Find implementations" })
Snacks.keymap.set(
    "n",
    "<leader>lD",
    vim.lsp.buf.declaration,
    { desc = "Go to declaration", lsp = { method = "textDocument/declaration" } }
)
Snacks.keymap.set("n", "<leader>lr", function()
    Snacks.picker.lsp_references()
end, { desc = "LSP References" })
Snacks.keymap.set(
    "n",
    "<leader>lt",
    vim.lsp.buf.type_definition,
    { desc = "Go to type definition", lsp = { method = "textDocument/typeDefinition" } }
)
Snacks.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover", lsp = { method = "textDocument/hover" } })
keymap("n", "<leader>xn", vim.diagnostic.goto_next, "Next diagnostic")
keymap("n", "<leader>xp", vim.diagnostic.goto_prev, "Previous diagnostic")
keymap("n", "<leader>xb", function()
    vim.diagnostic.setloclist()
end, "Buffer diagnostics")
keymap("n", "<leader>xx", function()
    Snacks.picker.diagnostics()
end, "Workspace Diagnostics")
Snacks.keymap.set("n", "<leader>T", function()
    Snacks.terminal()
end, { desc = "Terminal" })

Snacks.keymap.set("n", "<leader>gg", function()
    Snacks.lazygit()
end, { desc = "Lazygit" })
Snacks.keymap.set("n", "<leader>gp", function()
    Snacks.picker.gh_pr()
end, { desc = "Pull Requests" })
Snacks.keymap.set("n", "<leader>gP", function()
    Snacks.picker.gh_pr({ state = "all" })
end, { desc = "Pull Requests (all)" })
Snacks.keymap.set("n", "<leader>gw", function()
    Snacks.gitbrowse()
end, { desc = "Open in browser" })
Snacks.keymap.set("n", "<leader>gd", function()
    Snacks.picker.git_diff()
end, { desc = "Git diff (hunks)" })

Snacks.keymap.set("n", "<leader>bb", function()
    Snacks.picker.buffers()
end, { desc = "Buffers" })
keymap("n", "<leader>bn", "<cmd>bnext<CR>", "Next")
keymap("n", "<leader>bp", "<cmd>bprevious<CR>", "Previous")
Snacks.keymap.set("n", "<leader>bd", function()
    Snacks.bufdelete()
end, { desc = "Delete buffer (smart)" })
keymap("n", "<leader>bD", "<cmd>bdelete<CR>", "Delete buffer (force)")
Snacks.keymap.set("n", "<leader>cR", function()
    Snacks.rename.rename_file()
end, { desc = "Rename file" })
Snacks.keymap.set("n", "<leader>z", function()
    Snacks.zen()
end, { desc = "Zen mode" })

keymap("n", "<leader>db", dap.toggle_breakpoint, "Toggle Breakpoint")
keymap("n", "<leader>dc", dap.continue, "Continue")
keymap("n", "<leader>di", dap.step_into, "Step Into")
keymap("n", "<leader>do", dap.step_over, "Step Over")
keymap("n", "<leader>dO", dap.step_out, "Step Out")
keymap("n", "<leader>dt", dapui.toggle, "Toggle DAP UI")
keymap("n", "<leader>de", dapui.eval, "Eval (cursor)")
keymap("v", "<leader>de", dapui.eval, "Eval (selection)")
keymap("n", "<leader>dr", function()
    dapui.float_element("repl", { enter = true })
end, "REPL (float)")
keymap("n", "<leader>dC", function()
    dapui.float_element("console", { enter = true })
end, "Console (float)")

local neotest = require("neotest")
keymap("n", "<leader>tn", function()
    neotest.run.run()
end, "Nearest")
keymap("n", "<leader>tf", function()
    neotest.run.run(vim.fn.expand("%"))
end, "File")
keymap("n", "<leader>ts", function()
    neotest.run.run(vim.fn.getcwd())
end, "Suite")
keymap("n", "<leader>tl", function()
    neotest.run.run_last()
end, "Last")
keymap("n", "<leader>tg", function()
    neotest.jump.last()
end, "Go To Last")
keymap("n", "<leader>td", function()
    neotest.run.run({ strategy = "dap" })
end, "Debug Nearest")
keymap("n", "<leader>tD", function()
    neotest.run.run(vim.fn.expand("%"), { strategy = "dap" })
end, "Debug File")
keymap("n", "<leader>to", function()
    neotest.output.open({ enter = true })
end, "Output")
keymap("n", "<leader>tS", function()
    neotest.summary.toggle()
end, "Summary")

keymap("n", "<leader>aa", "<cmd>CodeCompanionActions<cr>", "Action Palette")
keymap("n", "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", "Chat Toggle")
keymap("v", "<leader>ac", "<cmd>CodeCompanionChat Add<cr>", "Chat Add (selection)")

-- Go keymaps via Snacks.keymap (filetype-specific)
Snacks.keymap.set("n", "<leader>lg", "<cmd>GoFmt<cr>", { desc = "Go Format", ft = "go" })
Snacks.keymap.set("n", "<leader>lI", "<cmd>GoImports<cr>", { desc = "Go Imports", ft = "go" })
Snacks.keymap.set("n", "<leader>lA", "<cmd>GoAddTag<cr>", { desc = "Go Add Tags", ft = "go" })
Snacks.keymap.set("n", "<leader>lR", "<cmd>GoRmTag<cr>", { desc = "Go Remove Tags", ft = "go" })
Snacks.keymap.set("n", "<leader>ls", "<cmd>GoFillStruct<cr>", { desc = "Fill Struct", ft = "go" })
Snacks.keymap.set("n", "<leader>le", "<cmd>GoIfErr<cr>", { desc = "If Err", ft = "go" })
Snacks.keymap.set("n", "<leader>lc", "<cmd>GoCmt<cr>", { desc = "Comment", ft = "go" })

-- [[ SECTION: Finish ]]
vim.cmd.colorscheme("catppuccin")
