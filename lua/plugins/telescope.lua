return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  config = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })

    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")

    local builtin = require("telescope.builtin")

    -- Proximity sort picker implementation taken from:
    -- https://github.com/nvim-telescope/telescope.nvim/issues/939#issuecomment-2480104297
    local conf = require("telescope.config").values
    local finders = require("telescope.finders")
    local make_entry = require("telescope.make_entry")
    local pickers = require("telescope.pickers")
    local sorters = require("telescope.sorters")

    local function starts_with(str, prefix)
      return string.sub(str, 1, string.len(prefix)) == prefix
    end

    local function get_relative_buffer_path()
      local full_path = vim.api.nvim_buf_get_name(0)
      -- In case one of the following conditions apply, use the cwd.
      -- - We aren't in a file buffer.
      -- - The filename is empty.
      -- - The path isn't absolut.e.
      if full_path == nil or full_path == "" or not starts_with(full_path, "/") then
        return "."
      end

      -- Return the relative path of the buffer to the current cwd.
      -- That's what proxmity sort expects.
      local cwd = vim.fn.getcwd()
      local relative_path = string.gsub(full_path, cwd .. "/", "")
      -- Fallback to the cwd if:
      -- - The path equals the cwd.
      -- - We're in a neo-tree buffer
      if relative_path == "" or starts_with(full_path, "neo-tree") then
        return "."
      end
      return relative_path
    end

    -- A file picker that sorts entries based on the proximity of files relative to
    -- the file path of the current buffer.
    -- Requires the `proximity-sort` and `fd` binaries to be present.
    local proximity_files = function(opts)
      local path = get_relative_buffer_path()
      -- print(string.format("Relative proximity path: '%s'", path))

      local live_fd = finders.new_job(function(prompt)
        if not prompt or prompt == "" then
          prompt = "."
        end

        local cmd = {
          "bash",
          "-c",
          string.format(
            "fd --full-path --type f %s . | proximity-sort %s",
            vim.fn.shellescape(prompt),
            vim.fn.shellescape(path)
          ),
          -- Use this for multi-word queries like "src md"
          -- string.format('fd --full-path --type f . | sk --exact --filter %s | proximity-sort %s',
          --     vim.fn.shellescape(prompt), vim.fn.shellescape(path)),
        }
        -- print("Cmd: ", vim.inspect(cmd))
        return cmd
      end, opts.entry_maker or make_entry.gen_from_file(opts), opts.max_results, opts.cwd)

      pickers
        .new(opts, {
          prompt_title = "Proximity Files",
          finder = live_fd,
          previewer = conf.file_previewer(opts),
          sorter = sorters.highlighter_only(opts),
          push_cursor_on_edit = true,
          __locations_input = true,
        })
        :find()
    end

    local find_files = function()
      proximity_files({})
    end
    if vim.fn.executable("fd") == 0 or vim.fn.executable("proximity-sort") == 0 then
      vim.notify("Executables not availiable for proximity sort", vim.log.levels.INFO)
      find_files = builtin.find_files
    end

    vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
    vim.keymap.set("n", "<leader>sf", find_files, { desc = "[S]earch [F]iles" })
    vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
    vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
    vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })

    vim.keymap.set("n", "<leader>/", function()
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
      }))
    end, { desc = "[/] Fuzzily search in current buffer" })

    vim.keymap.set("n", "<leader>s/", function()
      builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      })
    end, { desc = "[S]earch [/] in Open Files" })
  end,
}
