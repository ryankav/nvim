-- Create a null_ls function so that the require call only occurs after the
-- plugin has been installed
--
-- TODO: Issue relating to inlay hints in neovim:
--   https://github.com/neovim/neovim/issues/18086
--   doubt I'll want full file inlay hints but on hover or on line might be
--   nice

local M = {
  servers = { "rust_analyzer" },
  tools = {},
  setup_lsp = function()
    local lspconfig = require("lspconfig")
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local on_attach = function(_, buf)
      require('core.keymaps.plugins.lsp').on_attach(buf)

      -- enable auto format on save as supported by rust_analyzer
      vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
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
            loadOutDirsFromCheck = true,
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
  setup_null_ls_sources = function(null_ls)
    return {}
  end
}

return M

