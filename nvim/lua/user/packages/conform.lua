local M = {}

function M.setup()
	vim.pack.add({
		{ src = "https://github.com/stevearc/conform.nvim" },
	})

	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "gofmt", "golines", "goimport" },
			nix = { "alejandra" },
		},
	})
end

return M
