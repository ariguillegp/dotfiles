local utils = require('config.utils')

-- Find files using Telescope command-line sugar.
utils.map('n', '<Leader>ff', '<cmd>Telescope find_files<CR>')
utils.map('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>')
utils.map('n', '<Leader>fb', '<cmd>Telescope buffers<CR>')
utils.map('n', '<Leader>fh', '<cmd>Telescope help_tags<CR>')
