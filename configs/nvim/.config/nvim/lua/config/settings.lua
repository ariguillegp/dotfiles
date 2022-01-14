local utils = require('config.utils')
local cmd = vim.cmd
local indent = 2

cmd 'syntax enable'
cmd 'filetype plugin indent on'
cmd [[set path+=**]]

utils.opt('w', 'number', true)                        -- set numbered lines
utils.opt('w', 'relativenumber', true)                -- set relative numbered lines
utils.opt('o', 'autoindent', true)
utils.opt('b', 'smartindent', true)
utils.opt('o', 'swapfile', false)                     -- creates a swapfile
utils.opt('o', 'backup', false)                       -- creates a backup file
utils.opt('o', 'writebackup', false)                  -- if file is being edited by another prog (or was written to file while editing w/ another prog), it is not allowed to be edited
utils.opt('o', 'incsearch', true)
utils.opt('o', 'ignorecase', true)                    -- ignore case in search patterns
utils.opt('o', 'smartcase', true)
utils.opt('o', 'hlsearch', false)                     -- don't highlight all matches on previous search pattern
utils.opt('o', 'hidden', true)
utils.opt('o', 'guicursor', '')
utils.opt('o', 'mouse', '')
utils.opt('o', 'errorbells', false)
utils.opt('o', 'scrolloff', 8 )
utils.opt('o', 'showmode', false)                     -- we don't need to see things like -- INSERT -- anymore
utils.opt('o', 'completeopt', 'menuone', 'noselect')  -- mostly just for cmp
utils.opt('w', 'colorcolumn', '80')
utils.opt('w', 'signcolumn', 'yes')                   -- always show the sign column, otherwise it would shift the text each time
utils.opt('o', 'splitright', true)                    -- force all vertical splits to go to the right of current window
utils.opt('o', 'cmdheight', 2)                        -- more space in the neovim command line for displaying messages
utils.opt('o', 'updatetime', 50)                      -- faster completion (4000ms default)
utils.opt('b', 'expandtab', true)                     -- convert tabs to spaces
utils.opt('b', 'tabstop', indent)                     -- insert 2 spaces for a tab
utils.opt('b', 'softtabstop', indent)
utils.opt('b', 'shiftwidth', indent)                  -- the number of spaces inserted for each indentation
utils.opt('b', 'fileencoding', 'utf-8')               -- the encoding written to a file
utils.opt('w', 'foldenable', false)                   -- show all text unfolded
