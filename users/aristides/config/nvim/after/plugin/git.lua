-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
    signs = {
        add = {text = '+'},
        change = {text = '~'},
        delete = {text = '_'},
        topdelete = {text = '‾'},
        changedelete = {text = '~'}
    }
}

--  Fugitive
--  git status keymap
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
