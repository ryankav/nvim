local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/nvim-cmp"
  },
  config = function()
    require("core.lsp")
  end,
}

return M

