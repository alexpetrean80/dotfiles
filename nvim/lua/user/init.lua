local M = {}

M.autocmds = require("user.autocmds")
M.lsp = require("user.lsp")
M.packages = require("user.packages")
M.opts = require("user.opts")
M.keymaps = require("user.keymaps")

function M.setup()
	M.opts.setup()
	M.packages.setup()
	M.autocmds.setup()
	M.lsp.setup()
	
	-- keymaps come last as there are maps depending on lsp/plugins
	M.keymaps.setup()
end

return M
