local fn = vim.fn
local inspect = vim.inspect

if fn.has("nvim-0.8") == 0 then
	error("Need Neovim 0.8+ in order to use this config")
end

for _, cmd in ipairs({ "git", "rg", { "fd", "fdfind" }, "cmake", "luarocks", "fzf" }) do
	local name = type(cmd) == "string" and cmd or inspect(cmd)
	local commands = type(cmd) == "string" and { cmd } or cmd
	---@cast commands string[]
	local found = false

	for _, c in ipairs(commands) do
		if fn.executable(c) == 1 then
			name = c
			found = true
		end
	end

	if not found then
		error(("`%s` is not installed"):format(name))
	end
end

-- Load main config
require("config")
