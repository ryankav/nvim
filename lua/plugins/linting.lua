return {
  "mfussenegger/nvim-lint",
  event = "BufReadPost",
  dependencies = { "mason.nvim" },
  opts = {
    -- linters_by_ft will be populated by the langs directory
    linters_by_ft = {},
    linters = {},
  },
  config = function(_, opts)
  end
}
