local utils = require('config.utils')

utils.map('n', 'Y', 'y$')

utils.map('n', '<Leader>h', '<cmd>wincmd h<CR>')
utils.map('n', '<Leader>j', '<cmd>wincmd j<CR>')
utils.map('n', '<Leader>k', '<cmd>wincmd k<CR>')
utils.map('n', '<Leader>l', '<cmd>wincmd l<CR>')
utils.map('n', '<Leader>pv', '<cmd>wincmd v<bar> :Ex <bar> :vertical resize 30<CR>')
