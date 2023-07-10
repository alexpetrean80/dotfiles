return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", "nvim-telescope/telescope-project.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
  },
  config = function(_)
    require("telescope").setup()
    require("telescope").load_extension("project")
    require("telescope").load_extension("fzf")
    require('telescope').load_extension('projects')
  end
}
