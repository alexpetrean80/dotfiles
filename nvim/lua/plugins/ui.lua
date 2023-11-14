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
    "marko-cerovac/material.nvim",
    config = function()
      require("material").setup({
        contrast = {
          non_current_windows = true, -- Enable contrasted background for non-current windows
        },
        -- styles = {               -- Give comments style such as bold, italic, underline etc.
        --   comments = { [[ italic = true ]] },
        --   strings = { [[ bold = true ]] },
        --   keywords = { [[ underline = true ]] },
        --   functions = { [[ bold = true, undercurl = true ]] },
        -- },
        plugins = { -- Uncomment the plugins that you use to highlight them
          "mini",
          "noice",
          "nvim-cmp",
          "nvim-web-devicons",
          "telescope",
          "trouble",
          "which-key",
        },

        disable = {
          colored_cursor = true, -- Disable the colored cursor
          borders = true,   -- Disable borders between verticaly split windows
          background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
          term_colors = false, -- Prevent the theme from setting terminal colors
          eob_lines = false, -- Hide the end-of-buffer lines
        },

        high_visibility = {
          lighter = false, -- Enable higher contrast text for lighter style
          darker = false, -- Enable higher contrast text for darker style
        },

        lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )

        async_loading = true,  -- Load parts of the theme asyncronously for faster startup (turned on by default)

        custom_colors = nil,   -- If you want to override the default colors, set this to a function

        custom_highlights = {},
      })
    end,
  },

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
