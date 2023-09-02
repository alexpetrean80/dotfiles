local function prettier()
	return {
		exe = "prettier", -- change this to your prettier path
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

local config = function()
	require("formatter").setup({
		logging = true,
		log_level = vim.log.levels.WARN,

		filetype = {
			c = { require("formatter.filetypes.c").clangformat },
			cmake = { require("formatter.filetypes.cmake").cmakeformat },
			cpp = { require("formatter.filetypes.cpp").clangformat },
			go = {
				require("formatter.filetypes.go").gofmt,
				require("formatter.filetypes.go").goimports,
				require("formatter.filetypes.go").golines,
			},

			javascript = { prettier() },
			javascriptreact = { prettier() },
			json = { prettier() },

			lua = {
				require("formatter.filetypes.lua").stylua,
			},

			python = {
				require("formatter.filetypes.python").black,
				require("formatter.filetypes.python").isort,
			},

			toml = { require("formatter.filetypes.toml").taplo },
			typescript = { prettier() },
			typescriptreact = { prettier() },

			sh = { require("formatter.filetypes.sh").shfmt },
			yaml = { require("formatter.filetypes.yaml").yamlfmt },
			["*"] = {
				require("formatter.filetypes.any").remove_trailing_whitespace,
			},
		},
	})
end

return {
	"mhartington/formatter.nvim",
	config = config,
}
