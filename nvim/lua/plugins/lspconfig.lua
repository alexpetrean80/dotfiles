local config = function(_, opts)
  local servers = opts.servers
  local capabilities =
      require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

  local function setup(server)
    local server_opts = vim.tbl_deep_extend("force", {
      capabilities = vim.deepcopy(capabilities),
    }, servers[server] or {})

    if opts.setup[server] then
      if opts.setup[server](server, server_opts) then
        return
      end
    elseif opts.setup["*"] then
      if opts.setup["*"](server, server_opts) then
        return
      end
    end
    require("lspconfig")[server].setup(server_opts)
  end

  local mappings = require("mason-lspconfig.mappings.server")
  if not mappings.lspconfig_to_package.lua_ls then
    mappings.lspconfig_to_package.lua_ls = "lua-language-server"
    mappings.package_to_lspconfig["lua-language-server"] = "lua_ls"
  end

  local mlsp = require("mason-lspconfig")
  local available = mlsp.get_available_servers()

  local ensure_installed = {
    "bashls",
    "clangd",
    "cssls",
    "docker_compose_language_service",
    "dockerls",
    "html",
    "lua_ls",
    "marksman",
    "omnisharp",
    "pyright",
    "rust_analyzer",
    "sqlls",
    "taplo",
    "tsserver",
    "yamlls",
  }
  for server, server_opts in pairs(servers) do
    if server_opts then
      server_opts = server_opts == true and {} or server_opts

      if server_opts.mason == false or not vim.tbl_contains(available, server) then
        setup(server)
      else
        ensure_installed[#ensure_installed + 1] = server
      end
    end
  end

  require("typescript").setup({
    server = {
      filetypes = {
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "javascript",
      },
    },
  })

  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = ensure_installed,
    automatic_installation = true,
  })
  require("mason-lspconfig").setup_handlers({ setup })
end
local lsp_servers = {
  lua_ls = {
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        diagnostics = {

          globals = { "vim" },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
  bashls = {},
  clangd = {
    capabilities = {
      offsetEncoding = "utf-8"
    }
  },
  html = {},
  cssls = {},
  gopls = {},
  jsonls = {},
  gdscript = {},
  dockerls = {},
  metals = {},
  pyright = {},
  rust_analyzer = {},
  taplo = {},
  vimls = {},
  yamlls = {},
  omnisharp = {},
}

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    lazy = true,
    dependencies = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { "jose-elias-alvarez/typescript.nvim" },
    },
    opts = {
      autoformat = false,
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      servers = lsp_servers,
      setup = {},
    },
    config = config,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").on_attach({})
    end,
  },
}
