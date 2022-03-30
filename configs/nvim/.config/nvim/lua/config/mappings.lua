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
utils.map('n', '<leader>h', '<cmd>wincmd h<CR>')
utils.map('n', '<leader>j', '<cmd>wincmd j<CR>')
utils.map('n', '<leader>k', '<cmd>wincmd k<CR>')
utils.map('n', '<leader>l', '<cmd>wincmd l<CR>')
utils.map('n', '<leader>pv', '<cmd>wincmd v<bar> :Ex <bar> :vertical resize 30<CR>')

--- qfixlist navigation
utils.map('n', '<C-j>', '<cmd>:cnext<CR>zz')
utils.map('n', '<C-k>', '<cmd>:cprev<CR>zz')
utils.map('n', '<leader>a', '<cmd>:cclose<CR>zz')
