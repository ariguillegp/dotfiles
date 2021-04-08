" search recursively inside path
set path+=**
" activate line numbers
set nu
" relative line numbers
set rnu
" try some indentation
set smartindent
set noswapfile
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
set undodir=~/.config/nvim/undodir
set undofile
" incremental search
set incsearch
" hide buffers
set hidden
" remove highlighting after search
set nohlsearch
" keep square cursor on insert mode
set guicursor=
" don't make sounds when erroring out
set noerrorbells
set termguicolors
" stay 8 lines apart from the page border when paging
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
" mark desirable width
set colorcolumn=80
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
" Give more space for displaying messages
set cmdheight=2
" Having longer updatetime (default is 4000 ms) leads to noticeable
" delays and poor user experience
set updatetime=50
" Don't pass messages to |ins-completion-menu|
set shortmess+=c
" tabs and spaces
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
" default file encoding
set encoding=utf-8
set fileencoding=utf-8
" disable folding by default
set nofoldenable
" try some syntax highlighting
syntax on
" set cursorline
highlight cursorline cterm=none
highlight cursorlinenr ctermfg=yellow
