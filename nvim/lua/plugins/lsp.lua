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
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

      local lsp = require("lspconfig")
      local lua_opts = lsp_zero.nvim_lua_ls()
      lsp.lua_ls.setup(lua_opts)

      -- local configs = require("lspconfig.configs")
      --
      -- if not configs.snyk then
      --   configs.snyk = {
      --     default_config = {
      --       -- pass cmd as .local/bin/snyk-lsp in my $HOME
      --       cmd = { "snyk-ls" },
      --       root_dir = function(name)
      --         return lsp.util.find_git_ancestor(name) or vim.loop.os_homedir()
      --       end,
      --       init_options = {
      --         activateSnykCode = "true",
      --       },
      --     },
      --   }
      -- end
      --
      -- lsp.snyk.setup({
      --   on_attach = lsp_zero.on_attach,
      -- })

      lsp_zero.setup()
    end,
  },
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  },
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").on_attach({})
  --   end,
  -- },
  { "towolf/vim-helm" },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
}
