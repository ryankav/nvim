return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "c", "cpp", "cuda" })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "clangd" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      clangd = {},
    },
  },
  {
    "p00f/clangd_extensions.nvim",
    config = function() end,
    opts = {
      inlay_hints = {
        inline = false,
      },
      ast = {
        role_icons = {
          type = "",
          declaration = "",
          expression = "",
          specifier = "",
          statement = "",
          ["template argument"] = "",
        },
        kind_icons = {
          Compound = "",
          Recovery = "",
          TranslationUnit = "",
          PackExpansion = "",
          TemplateTypeParm = "",
          TemplateTemplateParm = "",
          TemplateParamObject = "",
        },
      },
    },
  },
  -- TODO: add cmp sorter config see clangd_extension README or LazyNvim
  {
    "mfussenegger/nvim-lint",
    opts = {
      -- TODO: look into clang tidy integration
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- TODO: add clang format here
      },
    },
  },
}
