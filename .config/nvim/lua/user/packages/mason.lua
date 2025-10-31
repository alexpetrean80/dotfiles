local M = {}

function M.setup()
	vim.pack.add({
		{ src = "https://github.com/mason-org/mason.nvim" },
		{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	})
	require("mason").setup()
	require("mason-lspconfig").setup({
		automatic_enable = true,
		ensure_installed = {"lua_ls", "gopls", "tsserver", "sqls", "terraformls", "yamlls"}
	})
end

return M
