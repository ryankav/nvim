local M = {
  servers = { "clangd" },
  tools = {},
  setup_lsp = function()
    local on_attach = function(_, buf)
      require('core.keymaps.plugins.lsp').on_attach(buf)
    end

    require'lspconfig'.clangd.setup {
      on_attach = on_attach
    }
  end,
  setup_null_ls_sources = function(null_ls)
    return {}
  end
}

return M
