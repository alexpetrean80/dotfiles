local M = {}

M.keymap = require("user.utils").keymap

function M.setup()
	M.keymap("n", "<leader>\\", "<cmd>vsplit<CR>", "Vertical split")
	M.keymap("n", "<leader><leader>", MiniPick.builtin.files, "Files")
	M.keymap("n", "<leader>e", MiniFiles.open, "Explorer")
	M.keymap("n", "<leader>/", MiniPick.builtin.grep_live, "Live grep")
	M.lsp_maps()
	M.nav()
	M.git()
	M.buffers()
	M.debugger()
	M.testing()
	-- M.completion()
end

function M.lsp_maps()
	local conform = require("conform")

	M.keymap("n", "<leader>r", "<cmd>Lspsaga lsp_rename ++project<CRL>", "Rename")
	M.keymap("n", "<leader>la", "<cmd>Lspsaga code_action<CR>", "Code Actions")
	M.keymap("n", "<leader>lf", conform.format, "Format")
	M.keymap("n", "<leader>lF", "<cmd>Lspsaga finder<CR>", "Finder")
	M.keymap("n", "<leader>ld", "<cmd>Lspsaga peek_definition<CR>", "Peek definition")
	M.keymap("n", "<leader>li", "<cmd>Lspsaga finder imp<CR>", "Find implementations")
	M.keymap("n", "<leader>lD", vim.lsp.buf.declaration, "Go to declaration")
	M.keymap("n", "<leader>lr", function()
		MiniExtra.pickers.lsp({ scope = "references" })
	end, "LSP References")
	M.keymap("n", "<leader>lt", "<cmd>Lspsaga peek_type_definition<CR>", "Peek type definition")
	M.keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", "Hover")
	M.keymap("n", "<leader>xn", "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next diagnostic")
	M.keymap("n", "<leader>xp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Previous diagnostic")
	M.keymap("n", "<leader>xb", "<cmd>Lspsaga show_buf_diagnostics ++normal<CR>", "Buffer diagnostics")
	M.keymap("n", "<leader>xx", "<cmd>Lspsaga show_workspace_diagnostics ++normal<CR>", "Workspace Diagnostics")
	M.keymap("n", "<leader>T", "Lspsaga term_toggle<CR>", "Terminal")

end

function M.nav()
	vim.keymap.set("n", "<c-h>", "<cmd>TmuxNavigateLeft<CR>")
	vim.keymap.set("n", "<c-j>", "<cmd>TmuxNavigateDown<CR>")
	vim.keymap.set("n", "<c-k>", "<cmd>TmuxNavigateUp<CR>")
	vim.keymap.set("n", "<c-l>", "<cmd>TmuxNavigateRight<CR>")
end

function M.git()
	M.keymap("n", "<leader>gg", "<cmd>Lspsaga term_toggle lazygit<CR>i", "Lazygit")
	M.keymap("n", "<leader>gp", "<cmd>term gh pr create<CR>i", "Create PR")
	M.keymap("n", "<leader>gW", "<cmd>Lspsaga term_toggle gh pr view<CR>i", "View PR (Terminal)")
	M.keymap("n", "<leader>gw", "<cmd>!gh pr view --web<CR>", "View PR (Browser)")
	M.keymap("n", "<leader>gd", "<cmd>Lspsaga term_toggle gh dash<CR>i", "GH dash")
end

function M.buffers()
	M.keymap("n", "<leader>bb", MiniPick.builtin.buffers, "Buffers")
	M.keymap("n", "<leader>bn", "<cmd>bnext<CR>", "Next")
	M.keymap("n", "<leader>bp", "<cmd>bprevious<CR>", "Previous")
	M.keymap("n", "<leader>bd", "<cmd>bdelete<CR>", "Delete")
end

function M.debugger()
	local dap = require("dap")

	M.keymap("n", "<leader>db", dap.toggle_breakpoint, "Toggle Breakpoint")
	M.keymap("n", "<leader>dc", dap.continue, "Continue")
	M.keymap("n", "<leader>di", dap.step_into, "Step Into")
	M.keymap("n", "<leader>do", dap.step_over, "Step Over")
	M.keymap("n", "<leader>dO", dap.step_out, "Step Out")
	M.keymap("n", "<leader>dt", "<cmd>DapViewToggle<CR>", "Toggle View")
end

function M.testing()
	M.keymap("n", "<leader>tn", "<cmd>TestNearest<CR>", "Nearest")
	M.keymap("n", "<leader>tf", "<cmd>TestFile<CR>", "File")
	M.keymap("n", "<leader>ts", "<cmd>TestSuite<CR>", "Suite")
	M.keymap("n", "<leader>tl", "<cmd>TestLast<CR>", "Last")
	M.keymap("n", "<leader>tg", "<cmd>TestVisit<CR>", "Go To Last")
end

function M.completion()
	vim.api.nvim_set_keymap(
		"i",
		"<C-space>",
		"vim.lsp.completion.trigger()",
		{ noremap = true, silent = true, expr = true, desc = "Trigger LSP Completion" }
	)

	vim.api.nvim_set_keymap(
		"i",
		"<C-n>",
		'pumvisible() ? "<C-n>":"<C-n>"',
		{ noremap = true, silent = true, expr = true, desc = "Next completion item" }
	)

	vim.api.nvim_set_keymap(
		"i",
		"<C-p>",
		'pumvisible() ? "<C-p>":"<C-p>"',
		{ noremap = true, silent = true, expr = true, desc = "Previous completion item" }
	)

	vim.api.nvim_set_keymap(
		"i",
		"<CR>",
		'pumvisible() ? "<C-y>":"<CR>"',
		{ noremap = true, silent = true, expr = true, desc = "Accept completion or new line" }
	)

	vim.api.nvim_set_keymap(
		"i",
		"<Tab>",
		'pumvisible() ?"<C-n>":"<Tab>"',
		{ noremap = true, silent = true, expr = true, desc = "Next completion item or tab" }
	)

	vim.api.nvim_set_keymap(
		"i",
		"<S-Tab>",
		'pumvisible() ? "<C-p>":"<S-Tab>"',
		{ noremap = true, silent = true, expr = true, desc = "Previous completion item or shift-tab" }
	)
end

return M
