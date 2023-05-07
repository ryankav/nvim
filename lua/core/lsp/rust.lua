-- Create a null_ls function so that the require call only occurs after the
-- plugin has been installed
local M = {
  servers = { "rust_analyzer" },
  setup = function()
    local lspconfig = require("lspconfig")
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local on_attach = function(_, buf)
      require('core.keymaps.plugins.lsp').on_attach(buf)
    end

    lspconfig.rust_analyzer.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        ["rust-analyzer"] = {
          imports = {
            granularity = {
              group = "module",
            },
            prefix = "self",
          },
          cargo = {
            allFeatures = true,
            buildScripts = {
              enable = true,
            },
          },
          checkOnSave = {
            command = "clippy"
          },
          procMacro = {
            enable = true,
          },
          diagnostics = {
            enable = true,
            experimental = {
              enable = true
            }
          }
        },
      }
    }
  end,
}

return M

