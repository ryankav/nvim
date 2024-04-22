return {
  "chrisgrieser/nvim-genghis",
  version = false,
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "stevearc/dressing.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-omni",
  },
  config = function()
    local keymap = vim.keymap.set
    local genghis = require("genghis")
    keymap("n", "<leader>cx", genghis.chmodx)
    keymap("n", "<leader>fr", genghis.renameFile)
    keymap("n", "<leader>fm", genghis.moveAndRenameFile)
    keymap("n", "<leader>fn", genghis.createNewFile)
    keymap("n", "<leader>fd", genghis.trashFile)
    keymap("n", "<leader>fy", genghis.duplicateFile)

    local cmp = require("cmp")
    cmp.setup.filetype("DressingInput", {
      sources = cmp.config.sources({ { name = "omni" } }),
    })
  end,
}
