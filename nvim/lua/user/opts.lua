local M = {}

function M.setup()
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
				[vim.diagnostic.severity.ERROR] = " ",
				[vim.diagnostic.severity.WARN] = " ",
				[vim.diagnostic.severity.HINT] = " ",
				[vim.diagnostic.severity.INFO] = " ",
			},
		},
	})
end

return M
