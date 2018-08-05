" plugins expect bash - not fish, zsh, etc
set shell=bash

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" which key should be the <leader>
" (\ is the default, but ',' is more common, and easier to reach)
let mapleader=","

" toggle the display of line numbers
noremap <F10> :set invnumber<CR>

" zoom out the current windows
noremap <F9> :tabnew %<CR>

" try to get terminal colors as close to the gui colors as possible
let g:rehash256 = 1

" set mouse support
set mouse=

colorscheme wombat256
set number
" set cursorline
highlight cursorline cterm=none
highlight cursorlinenr ctermfg=yellow
set background=dark

" change the color for the line numbers
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" pathogen will load the other modules
execute pathogen#infect()

" we want to tell the syntastic module when to run
" we want to see code highlighting and checks when  we open a file
" but we don't care so much that it reruns when we close the file
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" we also want to get rid of accidental trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" tell vim to allow you to copy between files, remember your cursor
" position and other little nice things like that
set viminfo='100,\"2500,:200,%,n~/.viminfo

"---------------------------------------------
" GO-VIM
"---------------------------------------------
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
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" update time for the identifier underneath the cursor
set updatetime=800

" enable syntax based folding
"set foldmethod=syntax

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
let g:go_auto_type_info = 1

let g:go_fmt_autosave = 1

" Sometimes when using both vim-go and syntastic Vim will start lagging while
" saving and opening files. The following fixes this
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" Open go doc in vertical window, horizontal, or tab
" au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
" au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
" au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>
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

"---------------------------------------------
" lightline
"---------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste'],
      \             [ 'fugitive', 'filename', 'modified', 'ctrlpmark' ],
      \             [ 'go'] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'go'] ],
      \ },
      \ 'component_function': {
      \   'lineinfo': 'LightLineInfo',
      \   'percent': 'LightLinePercent',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename',
      \   'go': 'LightLineGo',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \   'fugitive': 'LightLineFugitive',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineInfo()
  return winwidth(0) > 60 ? printf("%3d:%-2d", line('.'), col('.')) : ''
endfunction

function! LightLinePercent()
  return &ft =~? 'vimfiler' ? '' : (100 * line('.') / line('$')) . '%'
endfunction

function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LightLineGo()
  " return ''
  return exists('*go#jobcontrol#Statusline') ? go#jobcontrol#Statusline() : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == 'ControlP' ? 'CtrlP' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  if mode() == 't'
    return ''
  endif

  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]')
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
      \ 'main': 'CtrlPStatusFunc_1',
      \ 'prog': 'CtrlPStatusFunc_2',
      \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

"---------------------------------------------
" NERDTree
"---------------------------------------------
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>

let NERDTreeShowHidden=1

" opens NERDTree automatically if no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" quit vim if the only buffer left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"---------------------------------------------
" neocomplete
"---------------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

if !exists('g:neocomplete#sources')
	let g:neocomplete#sources = {}
endif
let g:neocomplete#sources._ = ['buffer', 'member', 'tag', 'file', 'dictionary']
let g:neocomplete#sources.go = ['omni']

" disable sorting
call neocomplete#custom#source('_', 'sorters', [])

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"---------------------------------------------
" UltiSnips
"---------------------------------------------
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction


if !exists("g:UltiSnipsJumpForwardTrigger")
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif

if !exists("g:UltiSnipsJumpBackwardTrigger")
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"

"---------------------------------------------
" vim-choosewin
"---------------------------------------------

" invoke with '-'
nmap  -  <Plug>(choosewin)


"---------------------------------------------
" save and reload a session
"---------------------------------------------
" Creates a session
function! MakeSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:sessionfile = b:sessiondir . '/session.vim'
  exe "mksession! " . b:sessionfile
endfunction

" Updates a session, BUT ONLY IF IT ALREADY EXISTS
function! UpdateSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe "mksession! " . b:sessionfile
    echo "updating session"
  endif
endfunction

" Loads a session if it exists
function! LoadSession()
  if argc() == 0
    let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
    let b:sessionfile = b:sessiondir . "/session.vim"
    if (filereadable(b:sessionfile))
      exe 'source ' b:sessionfile
    else
      echo "No session loaded."
    endif
  else
    let b:sessionfile = ""
    let b:sessiondir = ""
  endif
endfunction

au VimEnter * nested :call LoadSession()
au VimLeave * :call UpdateSession()
map <leader>y :call MakeSession()<CR>

"---------------------------------------------
" End config
"

" run local customization to override global customization

let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
	source $LOCALFILE
endif
