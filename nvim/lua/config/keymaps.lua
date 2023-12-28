local opts = { silent = true }

local keymap = vim.keymap

local get_opts = function(description)
  return {
    silent = true,
    noremap = true,
    nowait = true,
    desc = description,
  }
end

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

-- Splits
keymap.set("n", "<leader>\\", "<cmd>vsp<CR>", get_opts("Vertical split"))
keymap.set("n", "<leader>-", "<cmd>sp<CR>", get_opts("Horizontal split"))

keymap.set("n", "<leader>e", "<cmd>lua MiniFiles.open()<CR>", get_opts("Explorer"))

-- Buffers
keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", get_opts("Next"))
keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", get_opts("Previous"))
keymap.set("n", "<leader>bd", "<cmd>bd<CR>", get_opts("Delete"))

-- LSP
keymap.set("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", get_opts("Code action"))
keymap.set("n", "<leader>f", "<cmd> lua vim.lsp.buf.format({async=true})<CR>", get_opts("Format"))
