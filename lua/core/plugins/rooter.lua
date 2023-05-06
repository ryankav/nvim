local M = {
  "airblade/vim-rooter",
  config = function()
    -- Only change working directory if child of a git repository. If file is
    -- within a git repostitory set the working directory to be the root of the
    -- repository.
    vim.g.rooter_patterns = { ".git" }
  end
}

return M

