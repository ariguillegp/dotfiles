-- Git Worktrees
-- These are all default values
require("git-worktree").setup({
    change_directory_command = "cd",
    update_on_change = true,
    update_on_change_command = "e .",
    clearjumps_on_change = true,
    autopush = false
})

require("gitsigns").setup({
  -- See `:help gitsigns.txt`
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  }
})

--  Fugitive
--  git status keymap
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
