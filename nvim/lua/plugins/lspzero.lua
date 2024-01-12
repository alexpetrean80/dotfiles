return {
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
}
