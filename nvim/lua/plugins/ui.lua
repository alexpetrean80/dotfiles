return {
  {
    "echasnovski/mini.files",
    version = false,
    config = function()
      require("mini.files").setup({})
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        integrations = {
          alpha = true,
          gitsigns = true,
          mason = true,
          mini = true,
          neotree = true,
          noice = true,
          cmp = true,
          treesitter_context = true,
          treesitter = true,
          ts_rainbow2 = true,
          telescope = true,
          illuminate = true,
          sandwich = true,
          which_key = true,
        },
      })
    end,
  },
}
