local M = {
  server = "rust_analyzer",
  setup = function()
    local lspconfig = require("lspconfig")
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    lspconfig.rust_analyzer.setup {
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          imports = {
            granularity = {
              group = "module",
            },
            prefix = "self",
          },
          cargo = {
            buildScripts = {
              enable = true,
            },
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
  end
}

return M

