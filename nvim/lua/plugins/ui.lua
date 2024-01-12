return {
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      local wc = require("which-key")

      wc.register({
        b = { name = "Buffers" },
        l = { name = "LSP" },
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
  },
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
          indent_blankline = {
            enabled = true,
            scope_color = "lavender",
            colored_indent_levels = false,
          },
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
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      local lualine = require("lualine")
      local get_lsp = function()
        local msg = "No Active Lsp"
        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        local clients = vim.lsp.get_active_clients()

        if next(clients) == nil then
          return msg
        end

        for _, client in ipairs(clients) do
          if client.name == "null-ls" or client.name == "copilot" then
            goto continue
          end

          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
          end

          ::continue::
        end
        return msg
      end

      local colors = {
        yellow = "#f9e2af",
        teal = "#94e2d5",
        sky = "#89dceb",
        green = "#a6e3a1",
        peach = "#fab387",
        mauve = "#cba6f7",
        rosewater = "#f5e0dc",
        blue = "#89b4fa",
        red = "#f38ba8",
      }

      local conditions = {
        buffer_not_empty = function()
          return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
        end,
        hide_in_width = function()
          return vim.fn.winwidth(0) > 80
        end,
        check_git_workspace = function()
          local filepath = vim.fn.expand("%:p:h")
          local gitdir = vim.fn.finddir(".git", filepath .. ";")
          return gitdir and #gitdir > 0 and #gitdir < #filepath
        end,
      }

      -- Config
      local config = {
        options = {
          -- Disable sections and component separators
          component_separators = "",
          section_separators = "",
          theme = "catppuccin",
        },
        sections = {
          -- these are to remove the defaults
          lualine_a = {},
          lualine_b = {},
          lualine_y = {},
          lualine_z = {},
          -- These will be filled later
          lualine_c = {},
          lualine_x = {},
        },
        inactive_sections = {
          -- these are to remove the defaults
          lualine_a = {},
          lualine_b = {},
          lualine_y = {},
          lualine_z = {},
          lualine_c = {},
          lualine_x = {},
        },
      }

      -- Inserts a component in lualine_c at left section
      local function ins_left(component)
        table.insert(config.sections.lualine_c, component)
      end

      -- Inserts a component in lualine_x at right section
      local function ins_right(component)
        table.insert(config.sections.lualine_x, component)
      end

      ins_left({
        -- mode component
        function()
          return ""
        end,
        color = function()
          -- auto change color according to neovims mode
          local mode_color = {
            n = colors.red,
            i = colors.green,
            v = colors.blue,
            [""] = colors.blue,
            V = colors.blue,
            c = colors.rosewater,
            no = colors.red,
            s = colors.peach,
            S = colors.peach,
            [""] = colors.peach,
            ic = colors.yellow,
            R = colors.mauve,
            Rv = colors.mauve,
            cv = colors.red,
            ce = colors.red,
            r = colors.teal,
            rm = colors.teal,
            ["r?"] = colors.teal,
            ["!"] = colors.red,
            t = colors.red,
          }
          return { fg = mode_color[vim.fn.mode()] }
        end,
        padding = { right = 1 },
      })

      ins_left({
        "diff",
        -- Is it me or the symbol for modified us really weird
        symbols = { added = " ", modified = "󰝤 ", removed = " " },
        diff_color = {
          added = { fg = colors.green },
          modified = { fg = colors.peach },
          removed = { fg = colors.red },
        },
        cond = conditions.hide_in_width,
      })
      ins_left({
        "branch",
        icon = "",
        color = { fg = colors.mauve, gui = "bold" },
      })

      ins_left({
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", info = " " },
        diagnostics_color = {
          color_error = { fg = colors.red },
          color_warn = { fg = colors.yellow },
          color_info = { fg = colors.teal },
        },
      })

      -- Insert mid section. You can make any number of sections in neovim :)
      -- for lualine it's any number greater then 2
      ins_left({
        function()
          return "%="
        end,
      })

      ins_left({
        "filename",
        cond = conditions.buffer_not_empty,
        file_status = true,
        newfile_status = true,
        path = 1,
        color = { fg = colors.mauve, gui = "bold" },
      })
      ins_left({
        -- filesize component
        "filesize",
        cond = conditions.buffer_not_empty,
        color = { fg = colors.blue },
      })

      ins_right({
        -- Lsp server name .
        get_lsp,
        icon = " ",
        color = { fg = colors.teal, gui = "bold" },
      })

      -- Add components to right sections
      ins_right({
        "o:encoding",   -- option component same as &encoding in viml
        fmt = string.upper, -- I'm not sure why it's upper case either ;)
        cond = conditions.hide_in_width,
        color = { fg = colors.yellow, gui = "bold" },
      })

      ins_right({
        "fileformat",
        fmt = string.upper,
        icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
        color = { fg = colors.green, gui = "bold" },
      })

      -- Now don't forget to initialize lualine
      lualine.setup(config)
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
    keys = {
      { "<leader> ",  "<cmd>Telescope find_files<CR>", desc = "Find file" },
      { "<leader>/",  "<cmd>Telescope live_grep<CR>",  desc = "Grep" },
      { "<leader>bb", "<cmd>Telescope buffers<CR>",    desc = "Buffers" },
      {
        "<leader>F",
        "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({ previewer = false })<CR>",
        desc = "Fuzzy find",
      },
    },
    config = function()
      local t = require("telescope")
      t.setup()
      t.load_extension("fzf")
    end,
  },
  {'f-person/auto-dark-mode.nvim', config = function()
    local auto_dark_mode = require('auto-dark-mode')

    auto_dark_mode.setup({
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option('background', 'dark')
        vim.cmd('colorscheme catppuccin')
      end,
      set_light_mode = function()
        vim.api.nvim_set_option('background', 'light')
        vim.cmd('colorscheme catppuccin')
      end,
    })
  end
  }
}
