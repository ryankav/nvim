-- It's reccommended to not install rust analyzer through mason to make sure that
-- the analyzer used matches the toolchain being used so has to be installed on
-- the host.
-- TODO: add a check on required host tools to decide if part of config
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "rust", "toml" })
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    lazy = false,
    version = "^4", -- Recommended
    opts = {
      server = {
        on_attach = function(_, bufnr)
          -- TODO: add the keybindings for the lsp in here
        end,
        default_settings = {
          -- rust-analyzer language server configuration
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              buildScripts = {
                enable = true,
              },
            },
            -- Add clippy lints for Rust.
            checkOnSave = {
              allFeatures = true,
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
            procMacro = {
              enable = true,
              ignored = {
                ["async-trait"] = { "async_trait" },
                ["napi-derive"] = { "napi" },
                ["async-recursion"] = { "async_recursion" },
              },
            },
          },
        },
      },
    },
    config = function(_, opts)
      vim.g.rustaceanvim = opts
    end,
  },
  -- TODO: add crate integration for cmp
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    config = function()
      require("crates").setup()
    end,
  },
}
