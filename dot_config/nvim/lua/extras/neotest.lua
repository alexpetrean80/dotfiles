return {
  { import = "lazyvim.plugins.extras.test.core" },

  { "fredrikaverpil/neotest-golang", version = "*" },
  { "nvim-neotest/neotest" },
  { "nvim-neotest/neotest-python" },

  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-golang"] = {
          dap_go_enabled = true,
        },
      },
    },
  },
}
