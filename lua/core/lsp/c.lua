local M = {
  servers = { "clangd" },
  setup = function()
    require'lspconfig'.clangd.setup{}
  end,
  null_ls_sources = {}
}

return M
