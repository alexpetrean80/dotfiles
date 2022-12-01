local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

return {
	cmd = { "pylsp" },
	root_dir = function(fname)
		local root_files = {
			"pyproject.toml",
			"setup.cfg",
		}
		return lspconfig.util.root_pattern(unpack(root_files))(fname) or lspconfig.util.find_git_ancestor(fname)
	end,
	settings = {
		configurationSources = { "pylint" },
	},
	plugins = {
		flake8 = { enabled = true },
		isort = { enabled = true },
		black = { enabled = true },
		mypy = { enabled = true },
	},
}
