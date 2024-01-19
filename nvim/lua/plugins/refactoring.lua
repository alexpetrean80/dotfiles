return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    { "<leader>R", "<cmd>lua require('refactoring').select_refactor()<CR>", mode = "v", desc = "Refactoring" },
    { "<leader>R", "<cmd>lua require('refactoring').select_refactor()<CR>", mode = "n", desc = "Refactoring" },
  },
  config = function()
    require("refactoring").setup({
      prompt_func_return_type = {
        go = true,
        java = true,

        cpp = true,
        c = true,
        h = true,
        hpp = true,
        cxx = true,
      },
      prompt_func_param_type = {
        go = true,
        java = true,

        cpp = true,
        c = true,
        h = true,
        hpp = true,
        cxx = true,
      },
      printf_statements = {},
      print_var_statements = {},
    })
  end,
}
