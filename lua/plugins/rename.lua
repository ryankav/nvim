return {
  {
    -- TODO: add this to lsp buffer keymap to allow for lsp rename integration
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  },
  {
    "nvim-pack/nvim-spectre",
    build = false,
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    keys = {
      {
        "<leader>sr",
        function()
          require("spectre").open()
        end,
        desc = "Replace in Files (Spectre)",
      },
    },
  },
}
