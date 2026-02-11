local M = {}

function M.setup()
    vim.pack.add({
        { src = "https://github.com/ray-x/go.nvim" },
        { src = "https://github.com/ray-x/guihua.lua" },
    })

    require("go").setup()

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
      require('go.format').goimports()
      end,
      group = format_sync_grp,
    })
end

return M
