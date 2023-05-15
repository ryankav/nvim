local M = {
  servers = { "clangd" },
  setup = function()
    local on_attach = function(_, buf)
      require('core.keymaps.plugins.lsp').on_attach(buf)
    end

    require'lspconfig'.clangd.setup {
      on_attach = on_attach
    }
  end,
  null_ls_sources = {}
}

return M
