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

keymap.set("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

keymap.set("n", "<leader>\\", "<cmd>vsp<CR>", { silent = true, noremap = true, nowait = true, desc = "Vertical split" })
keymap.set("n", "<leader>-", "<cmd>sp<CR>", { silent = true, noremap = true, nowait = true, desc = "Horizontal split" })

keymap.set("n", "du", "<cmd>diffupdate<CR>", opts)
