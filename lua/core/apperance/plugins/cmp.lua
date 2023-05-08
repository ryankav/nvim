-- create highlight group with background none to add to the completion floats
local format = function()
  return {
    format = require("lspkind").cmp_format({
      mode = "symbol_text",
      maxwidth = 50,
      menu = {
        buffer = "[Buf]",
        nvim_lsp = "[Lsp]",
        luasnip = "[Snip]",
        path = "[Path]",
      },
    }),
  }
end

local window = function()
  return {
    completion = {
      border = "rounded",
    },
    documentation = {
      border = "rounded",
    },
  }
end

local M = {
  format = format,
  window = window,
}

return M

