require("padfoot.options")
require("padfoot.keymaps")

require("padfoot.plugins")

require("onedark").load()

require("padfoot.telescope")
require("padfoot.treesitter")

require("padfoot.completion")

-- lsp
require("padfoot.lsp.general")
require("padfoot.lsp.lua")
require("padfoot.lsp.python")
require("padfoot.lsp.js")
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
