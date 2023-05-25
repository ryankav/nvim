local M = {
  -- add null-ls support with mason. null-ls requires plenary
  "jay-babu/mason-null-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    "williamboman/mason.nvim",
  },
  config = function ()
    --ensure the servers are installed
    require("mason-null-ls").setup({
      ensure_installed = require("core.lsp").tools
    })
    -- then setup null-ls
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = require("core.lsp").null_ls_sources(null_ls)
    })
  end
}

return M
