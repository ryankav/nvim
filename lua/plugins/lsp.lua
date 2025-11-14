return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    opts = {
      -- All lsp servers configured through nvim-lspconfig will automatically be installed if they
      -- don't already exist, except those that are added to the exclude table in the opts
      automatic_installation = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    event = { "BufReadPre", "BufNewFile" },
    -- The opts will be populated in the langs directory and be a map of the lsp server name as the
    -- key with the server options as the value
    opts = {},
    config = function(_, opts)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      for server, server_opts in pairs(opts) do
        server_opts.capailities = capabilities
        vim.lsp.config(server, server_opts)
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("r-lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
          map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
          map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
          map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
          map("gT", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype definition")
          map("<leader>ss", require("telescope.builtin").lsp_document_symbols, "[S]earch buffer [S]ymbols")
          map("<leader>sS", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[S]earch workspace [S]ymbols")
          map("<leader>rs", vim.lsp.buf.rename, "[R]ename [S]ymbol")
          map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
        end,
      })
    end,
  },
}
