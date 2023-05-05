-- This file is used to co-ordinate all the lsp specific config into one place
-- so that the plugins can be called appropriateely. The main purpose of doing
-- it this way is so that the lsp specific configuration can be maintained
-- within a file named on the language the server supports. Then all that is
-- needed is to require the file in here and call the insert function on the
-- module.
local servers = {}
local setup_fns = {}
-- add the modules server name used by mason-lspconfig to ensure the server is
-- installed and also adds the setup function to the list which will be called
-- by nvim-lspconfig once it is ready to be configured
local insert_lsp_config = function(mod)
  for _, server in pairs(mod.servers) do
    table.insert(servers, server)
  end

  table.insert(setup_fns, mod.setup)
end

-- Require all the desired lsp files below
insert_lsp_config(require("core.lsp.lua_ls"))
insert_lsp_config(require("core.lsp.rust"))
insert_lsp_config(require("core.lsp.c"))

local M = {
  servers = servers,
  setup = function()
    for _, fn in pairs(setup_fns) do
      fn()
    end
  end,
}

return M

