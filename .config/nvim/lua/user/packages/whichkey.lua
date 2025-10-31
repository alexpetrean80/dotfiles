local M = {}

M.maps = {
	{ "<leader>b", group = "Buffers", mode = "n" },
	{ "<leader>g", group = "Git", mode = "n" },
	{ "<leader>d", group = "Debug", mode = "n" },
	{ "<leader>l", group = "LSP", mode = "n" },
	{ "<leader>t", group = "Testing", mode = "n" },
}

function M.setup()
	vim.pack.add({
		{ src = "https://github.com/folke/which-key.nvim" },
	})

	require("which-key").setup({
		preset = "classic",
		delay = 0,
		show_help = false,
		show_keys = true,
		icons = {
			mappings = false,
		},
		win = {
			border = "none",
		},
		spec = M.maps,
	})
end

return M
