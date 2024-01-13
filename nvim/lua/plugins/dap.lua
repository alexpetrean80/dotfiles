return {
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },

    keys = {
      { "<leader>dc", "<cmd>DapContinue<CR>",         desc = "Continue" },
      { "<leader>di", "<cmd>DapStepInto<CR>",         desc = "Step Into" },
      { "<leader>do", "<cmd>DapStepOver<CR>",         desc = "Step Over" },
      { "<leader>dO", "<cmd>DapStepOut<CR>",          desc = "Step Out" },
      { "<leader>db", "<cmd>DapToggleBreakpoint<CR>", desc = "Toggle Breakpoint" },
      { "<leader>dr", "<cmd>DapToggleRepl<CR>",       desc = "Toggle Repl" },
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      dapui.setup()
    end,
  },
  {
    "leoluz/nvim-dap-go",
    dependencies = { "mfussenegger/nvim-dap" },
    keys = {
      { "<leader>dc", "<cmd>DapContinue<CR>",                             desc = "Continue" },
      { "<leader>dt", "<cmd>lua require('dap-go').debug_test()<CR>",      desc = "Debug test" },
      { "<leader>dl", "<cmd>lua require('dap-go').debug_last_test()<CR>", desc = "Debug last test" },
    },
    config = function()
      require("dap-go").setup()
    end,
  },
}
