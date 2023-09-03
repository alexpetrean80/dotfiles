return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      {
        "creativenull/efmls-configs-nvim",
        version = "v1.x.x",
      },
      {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        config = function()
          require("mason-tool-installer").setup({
            ensure_installed = {
              "bashls",
              "clangd",
              "cmake",
              "cssls",
              "dockerls",
              "docker_compose_language_service",
              "efm",
              "eslint",
              "golangci_lint_ls",
              "gopls",
              "html",
              "jsonls",
              "lua_ls",
              "marksman",
              "pyright",
              "sqlls",
              "taplo",
              "tsserver",
              "yamlls",
              "shellcheck",
              "stylelint",
              "prettier",
              "shfmt",
              "cpplint",
              "clang-format",
              "hadolint",
              "gitlint",
              "golangci-lint",
              "goimports",
              "golines",
              "eslint",
              "jq",
              "luacheck",
              "stylua",
              "flake8",
              "black",
              "isort",
              "ansible-lint",
              "yamllint",
            },
          })
        end,
      },
      {
        "hrsh7th/nvim-cmp",
        dependencies = {
          { "hrsh7th/cmp-nvim-lsp" },
          { "hrsh7th/cmp-path" },
          { "hrsh7th/cmp-buffer" },
          { "L3MON4D3/LuaSnip" },
        },
        config = function()
          local cmp = require("cmp")

          local luasnip = require("luasnip")

          cmp.setup({
            snippet = {
              expand = function(args)
                luasnip.lsp_expand(args.body)
              end,
            },
            sorting = {
              priority_weight = 2,
              comparators = {
                require("copilot_cmp.comparators").prioritize,
                cmp.config.compare.offset,
                cmp.config.compare.exact,
                cmp.config.compare.score,
                cmp.config.compare.recently_used,
                cmp.config.compare.locality,
                cmp.config.compare.kind,
                cmp.config.compare.sort_text,
                cmp.config.compare.length,
                cmp.config.compare.order,
              },
            },
            mapping = cmp.mapping.preset.insert({
              ["<C-d>"] = cmp.mapping.scroll_docs(-4),
              ["<C-f>"] = cmp.mapping.scroll_docs(4),
              ["<C-Space>"] = cmp.mapping.complete(),
              ["<CR>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
              }),
              ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
                else
                  fallback()
                end
              end, { "i", "s" }),
              ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                  luasnip.jump(-1)
                else
                  fallback()
                end
              end, { "i", "s" }),
            }),
            sources = {
              { name = "nvim_lsp" },
              { name = "luasnip" },
              { name = "path" },
              { name = "copilot" },
              {
                name = "buffer",
                option = {
                  get_bufnrs = function()
                    local buf = vim.api.nvim_get_current_buf()
                    local byte_size =
                        vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
                    if byte_size > 1024 * 1024 then
                      return {}
                    end
                    return { buf }
                  end,
                },
              },
            },
          })
        end,
      },
    },
    config = function()
      local lsp = require("lsp-zero").preset("lsp-only")

      lsp.on_attach(function(_, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
      end)

      local shellcheck = require("efmls-configs.linters.shellcheck")
      local stylelint = require("efmls-configs.linters.stylelint")
      local prettier = require("efmls-configs.formatters.prettier")
      local shfmt = require("efmls-configs.formatters.shfmt")
      local cpplint = require("efmls-configs.linters.cpplint")
      local clang_format = require("efmls-configs.formatters.clang_format")
      local hadolint = require("efmls-configs.linters.hadolint")
      local gitlint = require("efmls-configs.linters.gitlint")
      local golangci_lint = require("efmls-configs.linters.golangci_lint")
      local gofmt = require("efmls-configs.formatters.gofmt")
      local goimports = require("efmls-configs.formatters.goimports")
      local golines = require("efmls-configs.formatters.golines")
      local eslint = require("efmls-configs.linters.eslint")
      local eslint_fmt = require("efmls-configs.formatters.eslint")
      local jq = require("efmls-configs.linters.jq")
      local luacheck = require("efmls-configs.linters.luacheck")
      local stylua = require("efmls-configs.formatters.stylua")
      local flake8 = require("efmls-configs.linters.flake8")
      local black = require("efmls-configs.formatters.black")
      local isort = require("efmls-configs.formatters.isort")
      local prettier_eslint = require("efmls-configs.formatters.prettier_eslint")
      local ansible_lint = require("efmls-configs.linters.ansible_lint")
      local yamllint = require("efmls-configs.linters.yamllint")

      local efm_langs = {
        bash = { shellcheck, shfmt },
        c = { cpplint, clang_format },
        cpp = { cpplint, clang_format },
        css = { stylelint, prettier },
        docker = { hadolint },
        gitcommit = { gitlint },
        go = { golangci_lint, gofmt, goimports, golines },
        html = { prettier },
        javascript = { eslint, eslint_fmt, prettier },
        json = { jq, prettier },
        lua = { luacheck, stylua },
        python = { flake8, black, isort },
        typescript = { eslint, eslint_fmt, prettier, prettier_eslint },
        yaml = { ansible_lint, yamllint, prettier },
      }

      require("lspconfig").efm.setup(vim.tbl_extend("force", {
        filetypes = vim.tbl_keys(efm_langs),
        settings = {
          rootMarkers = { ".git/" },
          languages = efm_langs,
        },
        init_options = {
          documentFormatting = true,
          documentRangeFormatting = true,
        },
      }, {}))
      require("lspconfig").lua.setup({
        diagnostics = {
          globals = { "vim" },
        },
      })
      lsp.setup()
    end,
  },

  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").on_attach({})
    end,
  },
}
