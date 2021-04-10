local utils = require('utils')
utils.opt('o', 'completeopt', 'menuone,noinsert,noselect')
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
vim.o.shortmess = vim.o.shortmess .. 'c'

-- <Tab> to navigate the completion menu
utils.map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
utils.map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
