local normal_maps = {
  a = { "<cmd>Alpha<CR>", "Dashboard" },
  [" "] = { "<cmd>Telescope find_files<CR>", "Find file" },
  ["/"] = { "<cmd>Telescope live_grep<CR>", "Grep" },
  b = {
    name = "Buffers",
    n = { "<cmd>bnext<CR>", "Next" },
    p = { "<cmd>bprevious<CR>", "Previous" },
    b = { "<cmd>Telescope buffers<CR>", "Buffers" },
    d = { "<cmd>bd<CR>", "Delete" },
  },
  c = {
    name = "Copilot",
    a = { '<cmd>lua require("copilot.panel").accept()<CR>', "Accept suggestion" },
    n = { '<cmd>lua require("copilot.panel").jump_next()<CR>', "Next suggestion" },
    p = { '<cmd>lua require("copilot.panel").jump_prev()<CR>', "Previous suggestion" },
    r = { '<cmd>lua require("copilot.panel").refresh()<CR>', "Reject suggestion" },
  },
  e = { "<cmd>lua MiniFiles.open()<CR>", "Explorer" },
  H = { "<cmd>Telescope help_tags<CR>", "Help" },
  h = {
    name = "Harpoon",
    a = { "<cmd>lua require('harpoon.mark').add_file()<CR>", "Add file" },
    h = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Toggle menu" },
    n = { "<cmd>lua require('harpoon.ui').nav_next()<CR>", "Next file" },
    p = { "<cmd>lua require('harpoon.ui').nav_prev()<CR>", "Previous file" },
  },
  p = {
    name = "Projects",
    p = { "<cmd>Telescope projects<CR>", "List" },
    a = { "<cmd>AddProject<CR>", "Add" },
    r = { "<cmd>ProjectRoot<CR>", "CWD Project Root" },
  },
  ["\\"] = { "<cmd>vsplit<CR>", "Vertical split" },
  ["-"] = { "<cmd>split<CR>", "Horizontal split" },
  g = {
    name = "Git",
    b = { "<cmd>Telescope git_branches<CR>", "Branches" },
    g = { "<cmd>Neogit<CR>", "Neogit" },
    s = { "<cmd>Gitsigns stage_hunk()<CR>", "Stage hunk" },
    u = { "<cmd>Gitsigns undo_stage_hunk()<CR>", "Undo stage hunk" },
    ["["] = { "<cmd>Gitsigns next_hunk()<CR>", "Next hunk" },
    ["]"] = { "<cmd>Gitsigns prev_hunk()<CR>", "Previous hunk" },
  },
  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code action" },
    f = { "<cmd>lua vim.lsp.buf.format({async = true})<CR>", "Format" },
    d = {
      "<cmd>lua require('telescope.builtin').diagnostics(require('telescope.themes').get_ivy({}))<CR>",
      "File Diagnostics",
    },
    D = {
      "<cmd>lua require('telescope.builtin').diagnostics(require('telescope.themes').get_ivy({}))<CR>",
      "Project Diagnostics",
    },
    r = { ":IncRename ", "Rename" },
  },
  r = {
    name = "Refactoring",
    b = { "<cmd>lua require('refactoring').refactor('Extract Block')<CR>", "Extract block" },
    B = { "<cmd>lua require('refactoring').refactor('Extract Block To File')<CR>", "Extract block to file" },
    i = { "<cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline variable" },
  },
  M = { "<cmd>Mason<CR>", "Mason" },
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
  r = {
    name = "Refactoring",
    f = { "<Esc><cmd>lua require('refactoring').refactor('Extract Function')<CR>", "Extract function" },
    F = {
      "<Esc><cmd>lua require('refactoring').refactor('Extract Function To File')<CR>",
      "Extract function to file",
    },
    v = { "<Esc><cmd>lua require('refactoring').refactor('Extract Variable')<CR>", "Extract variable" },
    i = { "<Esc><cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline variable" },
  },
  g = {
    "Git",
    s = { "<cmd>Gitsigns stage_hunk<CR>", "Stage hunk" },
    r = { "<cmd>Gitsigns reset_hunk<CR>", "Reset hunk" },
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
