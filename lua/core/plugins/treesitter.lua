-- TODO: look into the treesitter extensions that will be wanted
local M = {
 "nvim-treesitter/nvim-treesitter",
  build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
  end,
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "rust",
        "toml",
        "javascript",
        "typescript",
        "tsx"
      },
      sync_install = false,
      ignore_install = {},
      autopairs = {
        enable = true
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    }
  end,
}

return M

