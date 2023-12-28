return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      local lsp_zero = require("lsp-zero").preset({})

      lsp_zero.on_attach(function(_, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr, preserve_mappings = false })
      end)

      local lsp = require("lspconfig")
      local lua_opts = lsp_zero.nvim_lua_ls()
      lsp.lua_ls.setup(lua_opts)

      lsp_zero.setup()
    end,
  },
  {
    "smjonas/inc-rename.nvim",
    keys = { { "<leader>r", ":IncRename ", desc = "Rename" } },
    config = function()
      require("inc_rename").setup()
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").on_attach({})
    end,
  },
  { "towolf/vim-helm" },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>le", "<cmd>Trouble document_diagnostics<CR>",  desc = "Document diagnostics" },
      { "<leader>lE", "<cmd>Trouble workspace_diagnostics<CR>", desc = "Workspace diagnostics" },
      { "<leader>lq", "<cmd>Trouble quickfix<CR>",              desc = "Quickfix" },
      { "<leader>lr", "<cmd>Trouble lsp_references<CR>",        desc = "References" },
      { "<leader>ld", "<cmd>Trouble lsp_definitions<CR>",       desc = "Definitions" },
      { "<leader>lt", "<cmd>Trouble lsp_type_definitions<CR>",  desc = "Type definitions" },
    },
    opts = {},
  },
}
