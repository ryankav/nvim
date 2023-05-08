-- Need to have a snippet engine to display the completions. Inside keymaps
-- there is snippet engine specific commands so will need to be updated if
-- LuaSnip isn't used as snippet engine in the future

local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    -- snippet engine for cmp to work
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    -- autopairs to close pairs
    "windwp/nvim-autopairs",
    -- completion pictorgrams
    "onsails/lspkind.nvim",
    -- wait on color scheme
    "rose-pine/neovim",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    -- Show cmp even if only one match
    vim.opt.completeopt = { "menuone" }

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      view = {
        entries = {
          name = "custom",
          selection_order = "near_cursor",
        }
      },
      formatting = require("core.apperance.plugins.cmp").format(),
      window = require("core.apperance.plugins.cmp").window(),
      mapping = require("core.keymaps.plugins.cmp"),
      sources = {
        { name = "nvim_lsp", keyword_length = 3 },
        { name = "nvim_lsp_signature_help" },
        { name = "buffer" },
      }
    })

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end
}

return M

