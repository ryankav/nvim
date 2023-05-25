-- This file is used to co-ordinate all the lsp specific config into one place
-- so that the plugins can be called appropriateely. The main purpose of doing
-- it this way is so that the lsp specific configuration can be maintained
-- within a file named on the language the server supports. Then all that is
-- needed is to require the file in here and call the insert function on the
-- module.
local servers = {}
local tools = {}
local setup_lsp_fns = {}
local setup_null_ls_fns = {}

-- add the modules server name used by mason-lspconfig to ensure the server is
-- installed and also adds the setup function to the list which will be called
-- by nvim-lspconfig once it is ready to be configured
local insert_config = function(mod)
  for _, server in pairs(mod.servers) do
    table.insert(servers, server)
  end

-- The null ls tools are still servers that Mason needs to install
  for _, tool in pairs(mod.tools) do
    table.insert(tools, tool)
  end

  table.insert(setup_lsp_fns, mod.setup_lsp)
  table.insert(setup_null_ls_fns, mod.setup_null_ls_sources)
end

-- Require all the desired lsp files below
insert_config(require("core.lsp.lua_ls"))
insert_config(require("core.lsp.rust"))
insert_config(require("core.lsp.c"))
insert_config(require("core.lsp.typescript"))

local M = {
  servers = servers,
  tools = tools,
  setup_lsp = function()
    for _, fn in pairs(setup_lsp_fns) do
      fn()
    end
  end,
  null_ls_sources = function(null_ls)
    local sources = {}
    for _, fn in pairs(setup_null_ls_fns) do
      local null_ls_source = fn(null_ls)

      for _, source in pairs(null_ls_source) do
        table.insert(sources, source)
      end
    end

    return sources
  end
}

return M

