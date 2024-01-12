return {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    local wc = require("which-key")

    wc.register({
      b = { name = "Buffers" },
      l = {
        name = "LSP",
        c = { name = "Call hierarchy" },
        d = { name = "Diagnostics" },
        p = { name = "Peek" },
        f = { name = "Find" },
        t = { name = "Terminal" },
      },
    }, {
      mode = "n",
      prefix = "<leader>",
      buffer = nil,
      silent = true,
      noremap = true,
      nowait = false,
    })

    wc.setup({
      window = { margin = { 1, 0, 0, 0.8 }, border = "single" },
      layout = { height = { min = 4, max = 150 }, align = "left" },
    })
  end,
}
