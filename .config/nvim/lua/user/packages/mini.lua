local M = {}

M.utils = require("user.utils")

function M.setup()
	vim.pack.add({
		{
			src = "https://github.com/echasnovski/mini.nvim",
			version = "main",
		},
	})

	require("mini.starter").setup()
	require("mini.statusline").setup()
	require("mini.files").setup()
	require("mini.pick").setup()
	require("mini.pairs").setup()
	require("mini.surround").setup()
	require("mini.icons").setup()
	require("mini.indentscope").setup()
	require("mini.move").setup()
	require("mini.notify").setup()
	require("mini.extra").setup()
end

return M
