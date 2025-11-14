return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    main = "nvim-treesitter.configs", -- Sets main module to use for opts
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "query",
        "vim",
        "vimdoc",
      },
      auto_install = true,
      highlight = {
        enable = true,
      },
    },
  },
  {
    "aaronik/treewalker.nvim",
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      { "<C-k>", "<cmd>Treewalker Up<cr>", mode = { "n", "v" }, desc = "Move up in the treesiter AST" },
      { "<C-j>", "<cmd>Treewalker Down<cr>", mode = { "n", "v" }, desc = "Move down in the treesiter AST" },
      { "<C-h>", "<cmd>Treewalker Left<cr>", mode = { "n", "v" }, desc = "Move left in the treesiter AST" },
      { "<C-l>", "<cmd>Treewalker Right<cr>", mode = { "n", "v" }, desc = "Move right in the treesiter AST" },
    },
    opts = {
      highlight = true,
      highlight_duration = 250,
      highlight_group = "CursorLine",
    },
  },
}
