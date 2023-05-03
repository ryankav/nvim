local lspconfig = require("lspconfig")

-- These are the type of variables/functions we can define in the lsp setup
--
-- might be useful for things like python path though unsure if needed tbh
-- local before_init(
--
-- These are options that are passed straight to the lsp server
-- local init_options = function(init_options: table<string, string|table|bool>)
--
-- For things like completions
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
--
-- A callback that is ran after the server mounts is often useful for keybindings maybe completions?
-- local on_attach = function(client, buffer)
--
-- local settings = {} see below for an example
--
-- I do not believe we need to return anything for the plugin manager in order
-- to setup the lsp but this is worth investigating further in the future

-- enable autoclompletion via nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.rust_analyzer.setup({
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
        enable = true
      },
    }
  }
})

