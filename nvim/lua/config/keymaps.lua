local opts = { silent = true }

local keymap = vim.keymap

-- Move around splits
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Visual --
-- Stay in indent mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Better paste
keymap.set("v", "p", '"_dP', opts)

-- Telescope
keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
keymap.set("n", "gI", "<cmd>Telescope lsp_implementatinos<CR>", opts)
keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
keymap.set("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
