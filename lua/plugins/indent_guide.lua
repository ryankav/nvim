return {
  "echasnovski/mini.indentscope",
  event = { "BufReadPost", "BufNewFile" },
  version = false,
  opts = {
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
    },
  },
}
