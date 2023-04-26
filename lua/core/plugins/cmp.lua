local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help"
  },
  config = function()
    local cmp = require("cmp")
    mapping = require("lua.core.keymaps.plugins.cmp").mappings(cmp)
  end
}

return M

