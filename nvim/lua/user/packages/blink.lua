local M = {}

function M.setup()
	vim.pack.add({
		{ src = "https://github.com/L3MON4D3/LuaSnip" },
		{ src = "https://github.com/rafamadriz/friendly-snippets" },
		{
			src = "https://github.com/Saghen/blink.cmp",
			version = vim.version.range("1.*"),
		},
	})

	require("luasnip").config.set_config({
		history = true,
		updateevents = "TextChanged,TextChangedI",
		enable_autosnippets = true,
	})
	require("luasnip.loaders.from_vscode").lazy_load()

	require("blink.cmp").setup({
		keymap = {
			preset = nil,
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<CR>"] = { "accept", "fallback" },
		},
		completion = {
			documentation = { auto_show = true },
			list = { selection = { preselect = false } },
			trigger = {
				show_in_snippet = false,
			},
		},
	})
end

return M
