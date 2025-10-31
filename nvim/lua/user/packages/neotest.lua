local M = {}

function M.setup()
	vim.pack.add({
		{ src = "https://github.com/nvim-neotest/nvim-nio" },
		{ src = "https://github.com/nvim-lua/plenary.nvim" },
		{ src = "https://github.com/antoinemadec/FixCursorHold.nvim" },
		{ src = "https://github.com/nvim-neotest/neotest" },
		{ src = "https://github.com/fredrikaverpil/neotest-golang" },
	})

	require("neotest").setup({
		adapters = {
			require("neotest-golang")(),
		},
	})
end

return M
