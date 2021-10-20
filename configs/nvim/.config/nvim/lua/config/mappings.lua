local utils = require('config.utils')

--- behave like C and D
utils.map('n', 'Y', 'y$')

--- keep it centered
utils.map('n', 'n', 'nzzzv')
utils.map('n', 'N', 'Nzzzv')
utils.map('n', 'J', 'mzJ`z')

--- undo breakpoints
utils.map('i', ',', ',<c-g>u')
utils.map('i', '.', '.<c-g>u')
utils.map('i', '[', '[<c-g>u')
utils.map('i', '!', '!<c-g>u')
utils.map('i', '?', '?<c-g>u')

--- window navigation with vim keys
utils.map('n', '<Leader>h', '<cmd>wincmd h<CR>')
utils.map('n', '<Leader>j', '<cmd>wincmd j<CR>')
utils.map('n', '<Leader>k', '<cmd>wincmd k<CR>')
utils.map('n', '<Leader>l', '<cmd>wincmd l<CR>')
utils.map('n', '<Leader>pv', '<cmd>wincmd v<bar> :Ex <bar> :vertical resize 30<CR>')
