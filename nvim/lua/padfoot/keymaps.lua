local keymap = vim.keymap.set
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-S-k>", ":resize -2<CR>", opts)
keymap("n", "<C-S-j>", ":resize +2<CR>", opts)
keymap("n", "<C-S-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-S-l>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Comment
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- Which key
local wk = require("which-key")

local wk_opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

wk.setup()

wk.register({
	["/"] = { "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", "Comment" },
	["t"] = {
		name = "Diagnostics",
		t = { "<cmd>TroubleToggle<cr>", "Trouble" },
		w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace" },
		d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document" },
		q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
		l = { "<cmd>TroubleToggle loclist<cr>", "Loclist" },
		r = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
	},
	["b"] = { "<cmd>Telescope buffers<CR>", "Buffers" },
	["c"] = { "<cmd>bd<CR>", "Close Buffer" },
	["e"] = { "<cmd>NvimTreeToggle<CR>", "File Tree" },
	["f"] = { "<cmd>Telescope find_files search_dirs=.<CR>", "Find Files" },
	["F"] = { "<cmd>Telescope oldfiles<CR>", "Recent files" },
	["g"] = { "<cmd>Telescope live_grep search_dirs=.<CR>", "Grep" },
	["h"] = { "<cmd>nohlsearch<CR>", "Clear Highlights" },
	["j"] = { "<cmd>BufferLinePick<CR", "Jump To Buffer" },
	["n"] = { "<cmd>BufferLineCycleNext<CR>", "Next Buffer" },
	["N"] = { "<cmd>BufferLineCloseNext<CR>", "Close Next Buffer" },
	["p"] = { "<cmd>BufferLineCyclePrev<CR>", "Previous Buffer" },
	["P"] = { "<cmd>BufferLineClosePrev<CR>", "Close Previous Buffer" },
	["l"] = {
		name = "LSP",
		["a"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
		["f"] = { "<cmd>lua vim.lsp.buf.format{ async = true}<CR>", "Format" },
		["l"] = { "<cmd>lua vim.lsp.codelens.run<CR>", "CodeLens" },
		["q"] = { "<cmd>vim.diagnostic.setloclist<CR>", "Quickfix" },
		["r"] = { "<cmd>lua vim.lsp.buf.rename<CR>", "Rename" },
		["s"] = { "<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols" },
		["S"] = { "<cmd>Telescope lsp_dynamic_workspace_symbols", "Workspace Symbols" },
	},
}, wk_opts)
