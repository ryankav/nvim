-- comment
local M = {
  servers = { "tsserver" },
  tools = { "prettier", "eslint_d" },
  setup_lsp = function()
    local lspconfig = require("lspconfig")
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local on_attach = function(_, buf)
      require('core.keymaps.plugins.lsp').on_attach(buf)
    end

    lspconfig.tsserver.setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }
  end,
  setup_null_ls_sources = function(null_ls)
    return {
      null_ls.builtins.diagnostics.eslint_d,
      null_ls.builtins.formatting.prettier,
    }
  end
}

return M

