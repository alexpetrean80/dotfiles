-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>\\", "<cmd>vsplit<CR>", { desc = "Split Window Right", remap = true })

vim.keymap.del("n", "<leader>|")

vim.keymap.set("n", "<leader>bb", "<cmd>FzfLua buffers<CR>", { desc = "Buffer list" })
