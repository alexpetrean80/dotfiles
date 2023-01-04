require("padfoot.plugins")

require("padfoot.options")
require("padfoot.keymaps")

-- set onedark as theme if nvim is opened in wsl
local handle = io.popen("grep microsoft /proc/version | wc - l")
local res = handle:read("*a")
if res then
	require("onedark").load()
	vim.cmd([[colorscheme onedark]])
else
	vim.o.background = "dark"
	vim.cmd([[colorscheme gruvbox]])
end
handle:close()

require("padfoot.telescope")
require("padfoot.treesitter")

require("padfoot.completion")

-- lsp
require("padfoot.lsp.general")
require("padfoot.lsp.lua")
require("padfoot.lsp.python")
require("padfoot.lsp.js")
require("padfoot.lsp.golang")
require("padfoot.lsp.null_ls")

-- git
require("padfoot.git.signs")

require("padfoot.autopairs")
require("padfoot.comment")
require("padfoot.indent_blankline")
require("padfoot.illuminate")
require("padfoot.nvtree")
require("padfoot.lualine")
require("padfoot.bufferline")
