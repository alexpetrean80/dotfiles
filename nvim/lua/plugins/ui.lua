return {
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      show_dirname = false,
      show_basename = true,
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato", -- latte, frappe, macchiato, mocha
        background = {         -- :h background
          light = "latte",
          dark = "macchiato",
        },
        transparent_background = false, -- disables setting the background color.
        show_end_of_buffer = false,     -- shows the '~' characters after the end of buffers
        term_colors = false,            -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false,              -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15,            -- percentage of the shade to apply to the inactive window
        },
        no_italic = false,              -- Force no italic
        no_bold = false,                -- Force no bold
        no_underline = false,           -- Force no underline
        styles = {                      -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" },      -- Change the style of comments
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {},
        custom_highlights = {},

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          command_palette = true,
          inc_rename = true,
          lsp_doc_border = true,
          bottom_search = false,
          long_message_to_split = true,
        },
      })
    end,
  },
  {
    "echasnovski/mini.files",
    version = false,
    config = function()
      require("mini.files").setup()
    end,
  },
}
