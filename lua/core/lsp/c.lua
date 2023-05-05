local M = {
  server = "clangd",
  setup = function()
    require'lspconfig'.clangd.setup{}
  end
}

return M
