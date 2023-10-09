return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",       -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim",      -- optional
      "ibhagwan/fzf-lua",            -- optional
    },
    config = true
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd("highlight default link gitblame SpecialComment")
      vim.g.gitblame_enabled = 0
    end,
  },
}
