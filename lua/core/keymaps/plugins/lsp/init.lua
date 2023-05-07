-- File for default lsp keybindings that are used across all the lsp servers.
-- This requires a conservative approach so if there is a contentious
-- keybinding it doesn't live here. As the policy across this setup is to
-- favour isolation over duplication. The reason for this is to make all
-- mappings be additive
-- vim.keymap.set("n", "<leader>ft", vim.cmd.Ex, { desc = "Open file tree"})

local M = {
  on_attach = function(bufnr)
    local opts = { noremap = true, silent = true }
    -- goto commands
    vim.keymap.set(bufnr, "n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts, { desc="Goto definition" })
    vim.keymap.set(bufnr, "n", "gD", "<cmd>Telescope lsp_declaration<cr>", opts, { desc="Goto declaration" })
    vim.keymap.set(bufnr, "n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts, { desc="Goto implementation" })
    -- linter commands
    vim.keymap.set(bufnr, "n", "<leader>ln", "<cmd>lua vim.diagnostic.goto_next({border = 'rounded'})<CR>zz", opts, { desc="Goto implementation" })
    vim.keymap.set(bufnr, "n", "<leader>lN", "<cmd>lua vim.diagnostic.goto_prev({border = 'rounded'})<CR>zz", opts, { desc="Goto implementation" })
    vim.keymap.set(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.goto_prev({border = 'rounded'})<CR>zz", opts, { desc="Goto implementation" })
  end
}

return M

