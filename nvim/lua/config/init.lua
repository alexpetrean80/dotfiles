local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

local lazypath_exists
if vim.version.gt(vim.version(), { 10, 0, 0 }) then
	lazypath_exists = vim.uv.fs_stat(lazypath)
else
	lazypath_exists = vim.loop.fs_stat(lazypath)
end

if not lazypath_exists then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup({
	root = vim.fn.stdpath("data") .. "/lazy", -- directory where plugins will be installed
	spec = { {
		import = "plugins",
	} },
	lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json", -- lockfile generated after running update.
	defaults = {
		lazy = false, -- should plugins be lazy-loaded?
		version = nil,
	},
	install = {
		missing = true,
	},
	checker = {
		enabled = true,
    notify = false,
	},
})

local modules = { "config.autocmds", "config.options", "config.keymaps" }

for _, mod in ipairs(modules) do
	local ok, err = pcall(require, mod)
	if not ok then
		error(("Error loading %s...\n\n%s"):format(mod, err))
	end
end
