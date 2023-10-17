local normal_maps = {
  [" "] = { "<cmd>Telescope find_files<CR>", "Find file" },
  ["/"] = { "<cmd>Telescope live_grep<CR>", "Grep" },
  a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code action" },
  b = {
    name = "Buffers",
    n = { "<cmd>bnext<CR>", "Next" },
    b = { "<cmd>Telescope buffers<CR>", "Buffers" },
    p = { "<cmd>bprevious<CR>", "Previous" },
    d = { "<cmd>bd<CR>", "Delete" },
  },
  e = { "<cmd>lua MiniFiles.open()<CR>", "Explorer" },
  f = { "<cmd>lua vim.lsp.buf.format({async = true})<CR>", "Format" },
  h = {
    name = "Harpoon",
    a = { "<cmd>lua require('harpoon.mark').add_file()<CR>", "Add file" },
    h = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Toggle menu" },
    n = { "<cmd>lua require('harpoon.ui').nav_next()<CR>", "Next file" },
    p = { "<cmd>lua require('harpoon.ui').nav_prev()<CR>", "Previous file" },
  },
  r = { ":IncRename ", "Rename" },
  R = {
    name = "Refactoring",
    b = { "<cmd>lua require('refactoring').refactor('Extract Block')<CR>", "Extract block" },
    B = { "<cmd>lua require('refactoring').refactor('Extract Block To File')<CR>", "Extract block to file" },
    i = { "<cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline variable" },
  },
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
  R = {
    name = "Refactoring",
    f = { "<Esc><cmd>lua require('refactoring').refactor('Extract Function')<CR>", "Extract function" },
    F = {
      "<Esc><cmd>lua require('refactoring').refactor('Extract Function To File')<CR>",
      "Extract function to file",
    },
    v = { "<Esc><cmd>lua require('refactoring').refactor('Extract Variable')<CR>", "Extract variable" },
    i = { "<Esc><cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline variable" },
  },
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

  wc.setup()
end

return {
  "folke/which-key.nvim",
  config = config,
}
