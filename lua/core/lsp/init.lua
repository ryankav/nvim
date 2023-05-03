local lua_ls = require("core.lsp.lua_ls")

local servers = {}
local setup_fns = {}

for _, server in pairs(lua_ls.server) do
  table.insert(servers, server)
end

table.insert(setup_fns, lua_ls.setup)

local M = {
  servers = servers,
  setup = function()
    for _, fn in pairs(setup_fns) do
      fn()
    end
  end
}

return M

