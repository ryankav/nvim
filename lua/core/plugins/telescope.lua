local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    'nvim-lua/plenary.nvim',
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    -- Load the main keymaps we will need for telescope
    require("core.keymaps.plugins.telescope")

    local telescope = require("telescope")
    telescope.setup {
      defaults = {
        mappings = {
        },
      },
      pickers = {
        find_files = {
          hidden = false,
        },
        buffers = {
          ignore_current_buffer = true,
          sort_lastused = true,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case"
        },
      },
    }

    telescope.load_extension("fzf")
  end
}

return M

