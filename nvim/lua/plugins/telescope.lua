return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.4",
  dependencies = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
  keys = {
    { "<leader> ", "<cmd>Telescope find_files<CR>", desc = "Find file" },
    { "<leader>/", "<cmd>Telescope live_grep<CR>",  desc = "Grep" },
    {
      "<leader>F",
      "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({ previewer = false })",
      desc = "Fuzzy find",
    },
  },
  config = function()
    local t = require("telescope")
    t.setup()
    t.load_extension("fzf")
  end,
}
