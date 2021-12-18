local utils = require('config.utils')
utils.opt('o', 'completeopt', 'menu,menuone,noselect,noinsert')
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
vim.o.shortmess = vim.o.shortmess .. 'c'
