require("padfoot.plugins")

require("padfoot.options")
require("padfoot.keymaps")


-- set onedark as theme if nvim is opened in wsl
local handle = io.popen('grep microsoft /proc/version | wc - l')
if handle then
    local res = handle:read("*a")
    if res == 1 then
        require("onedark").load()
    end
end

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
