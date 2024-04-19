return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    init = function(plugin)
      require("lazy.core.loader").add_to_rtp(plugin)
      require("nvim-treesitter.query_predicates")
    end,
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {},
      incremental_selection = {},
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    enabled = true,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = { mode = "cursor", max_lines = 3 },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local keybindings = require("config.keymaps")
      require("nvim-treesitter.configs").setup({
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = keybindings.treesitter.select,
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = keybindings.treesitter.move.goto_next_start,
            goto_next_end = keybindings.treesitter.move.goto_next_end,
            goto_previous_start = keybindings.treesitter.move.goto_previous_start,
            goto_previous_end = keybindings.treesitter.move.goto_previous_end,
            goto_next = keybindings.treesitter.move.goto_next,
            goto_previous = keybindings.treesitter.move.goto_previous,
          },
        },
      })
    end,
  },
}
