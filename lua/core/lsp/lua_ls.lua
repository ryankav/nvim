local M = {
  server = "lua_ls",
  setup = function()
    local lspconfig = require("lspconfig")

    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    }
  end
}

return M

