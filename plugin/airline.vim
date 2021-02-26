let g:airline_powerline_fonts = 1 " correcting font issues
let g:airline#extensions#tabline#buffer_nr_show = 1 " show buffer number
let g:airline#extensions#tabline#enabled = 1 " Use the airline tabline (replacement for buftabline)
let g:airline#extensions#tabline#excludes = ['branches', 'index']
let g:airline#extensions#tabline#ignore_bufadd_pat = 'defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'

filetype plugin indent on " enable file type detection
