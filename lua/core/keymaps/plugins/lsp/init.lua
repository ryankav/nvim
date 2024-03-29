-- File for default lsp keybindings that are used across all the lsp servers.
-- This requires a conservative approach so if there is a contentious
-- keybinding it doesn't live here. As the policy across this setup is to
-- favour isolation over duplication. The reason for this is to make all
-- mappings be additive
-- vim.keymap.set("n", "<leader>ft", vim.cmd.Ex, { desc = "Open file tree"})

local function buffer_keymaps(bufnr)
    local opts_with_desc = function(desc)
      return { noremap = true, silent = true, buffer = bufnr, desc = desc}
    end
    -- goto commands
    vim.keymap.set("n", "<leader>gd", "<cmd>Telescope lsp_definitions<CR>zz", opts_with_desc("Get lsp definitions"))
    vim.keymap.set("n", "<leader>gD", "<cmd>Telescope lsp_declaration<CR>zz", opts_with_desc("Get lsp declarations"))
    vim.keymap.set("n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>zz", opts_with_desc("Get lsp implementations"))
    vim.keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>zz", opts_with_desc("Get lsp references"))
    vim.keymap.set("n", "<leader>gt", "<cmd>Telescope lsp_type_definitions<CR>zz", opts_with_desc("Get lsp type definitions"))
    -- linter commands
    vim.keymap.set("n", "<leader>ln", "<cmd>lua vim.diagnostic.goto_next({border = 'rounded'})<CR>zz", opts_with_desc("Goto next linter error"))
    vim.keymap.set("n", "<leader>lN", "<cmd>lua vim.diagnostic.goto_prev({border = 'rounded'})<CR>zz", opts_with_desc("Goto prev linter error"))
end

local M = {
  on_attach = buffer_keymaps
}

return M

