local M = {}

function M.setup()
	vim.pack.add({
		{ src = "https://github.com/nvimdev/lspsaga.nvim" },
	})

	require("lspsaga").setup({
		symbol_in_winbar = {
			enable = true,
		},
		implement = {
			enable = true,
		},
		ui = {
			border = "none",
			code_action = " ",
		},
	})
end

return M
