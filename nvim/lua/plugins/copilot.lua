local config = function()
  vim.defer_fn(function()
    require("copilot").setup({
      panel = {
        enabled = false,
      },
      suggestion = {
        enabled = false,
      },
      filetypes = {
        ["."] = true,
        yaml = true
      },
    })
  end, 100)
end

return {
  {
    "zbirenbaum/copilot.lua",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    cmd = "Copilot",
    event = "InsertEnter",
    config = config,
  },
}
