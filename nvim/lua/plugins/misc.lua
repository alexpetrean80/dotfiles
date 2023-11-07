return {
  { "tpope/vim-fugitive" },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd("highlight default link gitblame SpecialComment")
      vim.g.gitblame_enabled = 0
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
}
