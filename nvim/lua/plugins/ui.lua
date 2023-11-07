return {
  {
    "marko-cerovac/material.nvim",
    config = function()
      require("material").setup({
        contrast = {
          terminal = false,      -- Enable contrast for the built-in terminal
          sidebars = false,       -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
          floating_windows = true, -- Enable contrast for floating windows
          cursor_line = true,    -- Enable darker background for the cursor line
          non_current_windows = true, -- Enable contrasted background for non-current windows
          filetypes = {},        -- Specify which filetypes get the contrasted (darker) background
        },

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
          background =false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
          term_colors = false, -- Prevent the theme from setting terminal colors
          eob_lines = false, -- Hide the end-of-buffer lines
        },

        high_visibility = {
          lighter = false, -- Enable higher contrast text for lighter style
          darker = true, -- Enable higher contrast text for darker style
        },

        lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )

        async_loading = true,  -- Load parts of the theme asyncronously for faster startup (turned on by default)

        custom_colors = nil,   -- If you want to override the default colors, set this to a function

        custom_highlights = {}, -- Overwrite highlights with your own
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "material",
          component_separators = "|",
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = {
            { "mode", separator = { left = "", right = ""  }, right_padding = 2 },
          },
          lualine_b = { "filename", "branch" },
          lualine_c = {},
          lualine_x = {},
          lualine_y = { "filetype", "progress" },
          lualine_z = {
            { "location", separator = { right = "" }, left_padding = 2 },
          },
        },
        inactive_sections = {
          lualine_a = { "filename" },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { "location" },
        },
        tabline = {},
        extensions = {},
      })
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
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
