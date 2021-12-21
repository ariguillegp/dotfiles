local utils = require('config.utils')
local cmd = vim.cmd
local indent = 2

cmd 'syntax enable'
cmd 'filetype plugin indent on'
cmd [[set path+=**]]

utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', true)
utils.opt('o', 'autoindent', true)
utils.opt('b', 'smartindent', true)
utils.opt('o', 'swapfile', false)
utils.opt('o', 'backup', false)
utils.opt('o', 'writebackup', false)
utils.opt('o', 'incsearch', true)
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'hlsearch', false)
utils.opt('o', 'hidden', true)
utils.opt('o', 'guicursor', '')
utils.opt('o', 'mouse', '')
utils.opt('o', 'errorbells', false)
utils.opt('o', 'scrolloff', 8 )
utils.opt('o', 'showmode', false)
utils.opt('o', 'completeopt', 'menuone,noselect')
utils.opt('w', 'colorcolumn', '80')
utils.opt('w', 'signcolumn', 'yes')
utils.opt('o', 'cmdheight', 1)
utils.opt('o', 'updatetime', 50)
utils.opt('b', 'tabstop', indent)
utils.opt('b', 'softtabstop', indent)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'expandtab', true)
utils.opt('b', 'fileencoding', 'utf-8')
utils.opt('w', 'foldenable', false)
