local prettier = function()
	return {
		exe = "./node_modules/.bin/prettier",
		args = {
			"--config-precedence",
			"prefer-file",
			"--print-width",
			vim.bo.textwidth,
			"--stdin-filepath",
			vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
		},
		stdin = true,
	}
end

return {
	"mhartington/formatter.nvim",
	config = function()
		-- Utilitie for creating configurations
		local util = require("formatter.util")

		-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
		require("formatter").setup({
			-- Enable or disable logging
			logging = true,
			-- Set the log level
			log_level = vim.log.levels.WARN,
			-- All formatter configurations are opt-in

			filetype = {
				-- Formatter configurations for filetype "lua" go here
				-- and will be executed in order
				javascript = { prettier() },
				python = {
					require("formatter.filetypes.python").black,
				},
				typescript = { prettier() },
				lua = {
					require("formatter.filetypes.lua").stylua,
				},

				-- Use the special "*" filetype for defining formatter configurations on
				-- any filetype
				["*"] = {
					-- "formatter.filetypes.any" defines default configurations for any
					-- filetype
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})
	end,
}
