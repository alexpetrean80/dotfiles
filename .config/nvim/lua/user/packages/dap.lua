local M = {}

function M.setup()
	vim.pack.add({
		{ src = "https://github.com/mfussenegger/nvim-dap" },
		{ src = "https://github.com/leoluz/nvim-dap-go" },
		{ src = "https://github.com/igorlfs/nvim-dap-view" },
		{ src = "https://github.com/theHamsta/nvim-dap-virtual-text" },
	})

	require("dap-go").setup()
	require("nvim-dap-virtual-text").setup()
end

return M
