local config = function()
  require("lint").linters_by_ft = {
    c = { "cppcheck" },
    cpp = { "cppcheck" },
    go = { "golangcilint" },
    javascript = { "eslint" },
    javascriptreact = { "eslint" },
    json = { "jsonlint" },
    lua = { "luacheck" },
    python = { "flake8" },
    sh = { "shellcheck" },
    typescript = { "eslint" },
    typescriptreact = { "eslint" },
    yaml = { "yamllint" },
  }
end

return {
  "mfussenegger/nvim-lint",
  config = config,
}
