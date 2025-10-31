local M = {}

function M.setup()
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(args)
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			if client.server_capabilities.inlayHintProvider then
				vim.lsp.inlay_hint.enable(true)
			end
			-- whatever other lsp config you want
		end,
	})

	vim.api.nvim_create_autocmd("TextYankPost", {
		desc = "Highlight when yanking (copying) text",
		group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
		callback = function()
			vim.highlight.on_yank()
		end,
	})

	-- Auto-close terminal when process exits
	vim.api.nvim_create_autocmd("TermClose", {
		group = augroup,
		callback = function()
			if vim.v.event.status == 0 then
				vim.api.nvim_buf_delete(0, {})
			end
		end,
	})

	-- Disable line numbers in terminal
	vim.api.nvim_create_autocmd("TermOpen", {
		group = augroup,
		callback = function()
			vim.opt_local.number = false
			vim.opt_local.relativenumber = false
			vim.opt_local.signcolumn = "no"
		end,
	})

	-- Auto-resize splits when window is resized
	vim.api.nvim_create_autocmd("VimResized", {
		group = augroup,
		callback = function()
			vim.cmd("tabdo wincmd =")
		end,
	})

	vim.api.nvim_create_autocmd("VimEnter", {
		group = augroup,
		callback = function()
			vim.cmd("TSEnable highlight")
		end,
	})
end

return M
