local code_action = function()
  vim.lsp.buf.code_action()
end

local fzf_file = function()
  require("telescope.builtin").current_buffer_fuzzy_find({ previewer = false })
end

local format = function()
  vim.lsp.buf.format({ async = true })
end

local refactoring = function()
  require("refactoring").select_refactor()
end

local file_tree = function()
  MiniFiles.open()
end

local normal_maps = {
  [" "] = { "<cmd>Telescope git_files<CR>", "Find file" },
  ["/"] = { "<cmd>Telescope live_grep<CR>", "Grep" },
  a = { code_action, "Code action" },
  b = {
    name = "Buffers",
    n = { "<cmd>bnext<CR>", "Next" },
    b = { "<cmd>Telescope buffers<CR>", "Buffers" },
    p = { "<cmd>bprevious<CR>", "Previous" },
    d = { "<cmd>bd<CR>", "Delete" },
  },
  e = { file_tree, "Explorer" },
  f = { format, "Format" },
  F = { fzf_file, "Fuzzy find" },
  r = { ":IncRename ", "Rename" },
  R = { refactoring, "Refactoring" },
  l = {
    name = "LSP",
    e = { "<cmd>Trouble document_diagnostics<CR>", "Document diagnostics" },
    E = { "<cmd>Trouble workspace_diagnostics<CR>", "Workspace diagnostics" },
    q = { "<cmd>Trouble quickfix<CR>", "Quickfix" },
    r = { "<cmd>Trouble lsp_references<CR>", "References" },
    d = { "<cmd>Trouble lsp_definitions<CR>", "Definitions" },
    t = { "<cmd>Trouble lsp_type_definitions<CR>", "Type definitions" },
  },
}

local normal_opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}

local visual_maps = {
  R = { refactoring, "Refactoring" },
}

local visual_opts = {
  mode = "v",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}

local config = function()
  vim.o.timeout = true
  vim.o.timeoutlen = 300
  local wc = require("which-key")
  wc.register(normal_maps, normal_opts)
  wc.register(visual_maps, visual_opts)

  wc.setup({
    window = { margin = { 1, 0, 0, 0.8 }, border = "single" },
    layout = { height = { min = 4, max = 150 }, align = "left" },
  })
end

return {
  "folke/which-key.nvim",
  config = config,
}
