" enable filetype detection
filetype plugin indent on

" use goimports for formatting
let g:go_fmt_command = "goimports"

" change GoTest time out default from its 10s default (if needed)
let g:go_test_timeout = '10s'

" use quickfix list only for all the errors
let g:go_list_type = "quickfix"

" use camelcase on conversions by default
let g:go_snippet_case_type = "camelcase"

" show func and type declarations on GoDecls and GoDeclsDir
let g:go_decls_includes = "func,type"

"  show a single tab as 4 spaces instead of the default 8
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=2 shiftwidth=2

" update time for the identifier underneath the cursor
set updatetime=800

" enable syntax based folding
set foldmethod=syntax

" jump between errors in quickfix list
map <C-j> :cnext<CR>
map <C-h> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" turn highlighting on
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Automatically get signature/type info for object under cursor
let g:go_auto_type_info = 1

let g:go_fmt_autosave = 1

" Sometimes when using both vim-go and syntastic Vim will start lagging while
" saving and opening files. The following fixes this
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" :GoDef and GoInfo will use gopls
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" open the definition/declaration, in a new vertical, horizontal, or tab, for
" the word under your cursor
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

" Open the relevant Godoc for the word under the cursor with <leader>gd or open it vertically with <leader>gv
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
" Or open the Godoc in browser
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

" Show a list of interfaces which is implemented by the type under your cursor
au FileType go nmap <Leader>s <Plug>(go-implements)

" Show type info for the word under your cursor with <leader>i (useful if you
" have disabled auto showing type info via g:go_auto_type_info)
au FileType go nmap <Leader>i <Plug>(go-info)

" Rename the identifier under the cursor to a new name
au FileType go nmap <Leader>e <Plug>(go-rename)

" Run GoMetaLinter
au FileType go nmap <Leader>l <Plug>(go-metalinter)

au Filetype go nnoremap <leader>m :exe "GoErrCheck"<CR>

" commands to open the alternate file
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
