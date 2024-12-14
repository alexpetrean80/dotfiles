return {
  {
    "echasnovski/mini.files",
    opts = {
      options = {
        use_as_default_explorer = true,
      },
    },
    keys = {
      {
        "<leader>e",
        function()
          require("mini.files").open(vim.uv.cwd(), true)
        end,
        desc = "Explorer",
      },
      { "<leader>fM", false },
      { "<leader>fm", false },
    },
  },
}
