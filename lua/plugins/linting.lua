return {
  "mfussenegger/nvim-lint",
  event = "BufReadPost",
  dependencies = { "mason.nvim" },
  -- opts will be populated by lang module to be the linters by filetype
  opts = {},
  config = function(_, opts)
    require("lint").linters_by_ft = opts

    vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "TextChanged" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
