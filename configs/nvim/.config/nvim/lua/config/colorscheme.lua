local utils = require('config.utils')
local cmd = vim.cmd
utils.opt('o', 'termguicolors', true)
cmd 'colorscheme gruvbox'
