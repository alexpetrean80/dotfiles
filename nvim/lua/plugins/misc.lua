return {
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  },
  { "machakann/vim-sandwich" },
  {
    "echasnovski/mini.comment",
    version = "*",
    config = function()
      require("mini.comment").setup({
        pre_hook = function()
          return require("ts_context_commentstring.internal").calculate_commentstring()
        end,
      })
    end,
  },
  {
    "echasnovski/mini.pairs",
    version = false,
    config = function()
      require("mini.pairs").setup()
    end,
  },
  { "tpope/vim-obsession" },
}
