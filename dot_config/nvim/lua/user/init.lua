local M = {}

function M.setup()
    require("user.opts").setup()
    require("user.plugins").setup()
    require("user.autocmds").setup()
    require("user.lsp").setup()

    -- keymaps come last as there are maps depending on lsp/plugins
    require("user.keymaps").setup()
end

return M
