return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons",   -- optional
  },
  config = function()
    require("lspsaga").setup({
      breadcrumbs = {
        enable = true,
      },
      diagnostic = {
        diagnostic_only_current = true,
      },
      implement = {
        enable = true,
        sign = true,
        virtual_text = true,
      },
    })
  end,
  keys = {
    -- diagnostics
    { "<leader>ldn", "<cmd>Lspsaga diagnostic_jump_next<CR>",       desc = "Next diagnostic" },
    { "<leader>ldp", "<cmd>Lspsaga diagnostic_jump_prev<CR>",       desc = "Previous diagnostic" },
    { "<leader>ldd", "<cmd>Lspsaga show_workspace_diagnostics<CR>", desc = "Show workspace diagnostics" },

    { "<leader>lh",  "<cmd>Lspsaga hover_doc<CR>",                  desc = "Hover" },
    { "<leader>lo",  "<cmd>Lspsaga outline<CR>",                    desc = "Outline" },
    { "<leader>lr",  "<cmd>Lspsaga rename<CR>",                     desc = "Rename" },
    -- call hierarchy
    { "<leader>lci", "<cmd>Lspsaga incoming_calls<CR>",             desc = "Show incoming calls" },
    { "<leader>lco", "<cmd>Lspsaga outgoing_calls<CR>",             desc = "Show outgoing calls" },

    { "<leader>c",   "<cmd>Lspsaga code_action<CR>",                desc = "Code action" },

    -- definitions, implementations, stuff like that
    { "<leader>lpd", "<cmd>Lspsaga peek_definition<CR>",            desc = "Peek definition" },
    { "<leader>lpt", "<cmd>Lspsaga peek_type_definition<CR>",       desc = "Peek type definition" },
    { "<leader>lfd", "<cmd>Lspsaga finder def<CR>",                 desc = "Find definitions" },
    { "<leader>lfr", "<cmd>Lspsaga finder ref<CR>",                 desc = "Find references" },
    { "<leader>lfi", "<cmd>Lspsaga finder imp<CR>",                 desc = "Find implementations" },

    -- floating term
    { "<leader>ltt", "<cmd>Lspsaga term_toggle<CR>",                    desc = "Toggle" },
    { "<leader>ltg", "<cmd>Lspsaga term_toggle lazygit<CR>",            desc = "Lazygit" },
  },
}
