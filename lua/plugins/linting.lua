return {
  {
    "mfussenegger/nvim-lint",
    event = "BufReadPost",
    dependencies = { "mason.nvim" },
    -- opts will be populated by lang module to be the linters by filetype
    opts = {},
    config = function(_, opts)
      require("lint").linters_by_ft = opts

      vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
        callback = function()
          require("lint").try_lint()
          require("lint").try_lint("typos")
        end,
      })
    end,
  },
  {
    "rshkarin/mason-nvim-lint",
    event = "BufReadPost",
    dependencies = {
      "mason.nvim",
      "nvim-lint",
    },
    opts = { ignore_install = {} },
    config = function(_, opts)
      require("mason-nvim-lint").setup({
        automatic_installation = true,
        quiet_mode = false,
        ensure_installed = {}, --{ "typos" }, -- Install global linters here
        ignore_install = opts.ignore_install, -- Escape hatch for langs directory if we don't want to install with mason
      })
    end,
  },
}
