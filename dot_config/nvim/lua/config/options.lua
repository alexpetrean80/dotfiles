-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.wrap = true

vim.g.lazyvim_picker = "fzf"
vim.g.lazyvim_python_lsp = "ruff"

vim.opt.updatetime = 200
