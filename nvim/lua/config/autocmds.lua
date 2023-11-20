local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Highlight on yank
autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = "1000",
		})
	end,
})

-- Remove whitespace on save
autocmd("BufWritePre", {
	pattern = "",
	command = ":%s/\\s\\+$//e",
})

-- Don't auto comment new lines
autocmd("BufEnter", {
	pattern = "",
	command = "set fo-=c fo-=r fo-=o",
})

autocmd("Filetype", {
	pattern = { "xml", "html", "xhtml", "css", "scss", "javascript", "typescript", "yaml", "lua" },
	command = "setlocal shiftwidth=2 tabstop=2",
})

autocmd("Filetype", {
	pattern = { "gd", "gdscript", "gdscript3" },
	command = "setlocal shiftwidth=4 tabstop=4",
})


vim.cmd([[
augroup GodotTabs
  autocmd!
  autocmd FileType gd setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
augroup END
]])
