local M = {}

function M.setup()
	vim.pack.add({
		{
			src = "https://github.com/nvim-treesitter/nvim-treesitter",
			version = "master",
		},
		{ src = "https://github.com/neovim/nvim-lspconfig" },
		{
			src = "https://github.com/catppuccin/nvim",
			name = "catppuccin",
		},
		{ src = "https://github.com/christoomey/vim-tmux-navigator" },
		{ src = "https://github.com/HiPhish/rainbow-delimiters.nvim" },
		{ src = "https://github.com/vim-test/vim-test" },
		{ src = "https://github.com/f-person/git-blame.nvim" },
	})

	require("user.packages.mini").setup()
	require("user.packages.blink").setup()
	require("user.packages.whichkey").setup()
	require("user.packages.dap").setup()
	require("user.packages.conform").setup()
	require("user.packages.lspsaga").setup()
	require("user.packages.neotest").setup()
	vim.cmd('let test#strategy = "neovim_sticky"')
end

return M
