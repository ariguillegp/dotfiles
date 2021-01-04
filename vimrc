set shell=bash " plugins expect bash
set nocompatible " not vi compatible

"---------------------------------------------
" VIM plugins management
"---------------------------------------------

" Install vim-plug before doing anything
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Start plugins installation process
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'tag': 'v1.24', 'do': ':GoUpdateBinaries'}
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-sensible'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'sirver/ultisnips'
Plug 't9md/vim-choosewin'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'andrewradev/splitjoin.vim'
Plug 'andrewstuart/vim-kubernetes'
Plug 'Yggdroot/indentLine'
Plug 'pedrohdz/vim-yaml-folds'
Plug 'dense-analysis/ale'
" Install deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()

" Start deoplete
let g:deoplete#enable_at_startup = 1

" Run PlugInstall if there are missing plugins
if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"---------------------------------------------
" Syntax and indent
"---------------------------------------------

syntax on " turn on syntax highlighting
set showmatch " show matching braces when text indicator is over them

" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

colorscheme wombat256 " color schemes
set background=dark

" set cursorline
highlight cursorline cterm=none
highlight cursorlinenr ctermfg=yellow

" change the color for the line numbers
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" default file encoding
set encoding=utf-8
set fileencoding=utf-8

let g:airline_powerline_fonts = 1 " correcting font issues
filetype plugin indent on " enable file type detection

"---------------------------------------------
" Basic Editing Configs
"---------------------------------------------

set shortmess+=I  " disable startup message
set number " show line numbers
set rnu " relative line numbering
set incsearch " incremental search (as string is being typed)
set hls " highlight search

" backspace compatibility
" " indent  allow backspacing over autoindent
" eol     allow backspacing over line breaks (join lines)
" start   allow backspacing over the start of insert; CTRL-W and CTRL-U
"        stop once at the start of insert.
set backspace=indent,eol,start

" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab

" smart case-sensitive search
set ignorecase
set smartcase

" set mouse support
set mouse+=a

set nofoldenable " disable folding by default

"---------------------------------------------
" Misc Configs
"---------------------------------------------

" which key should be the <leader>
" (\ is the default, but ',' is more common, and easier to reach)
let mapleader=","

" toggle the display of line numbers
noremap <F10> :set invnumber<CR>

" open new tabs
noremap <F9> :tabnew %<CR>

" toggle relative numbering
nnoremap <C-n> :set rnu!<CR>

" save read-only files
command -nargs=0 Sudow w !sudo tee % >/dev/null

" pathogen will load the other modules
" execute pathogen#infect()

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

" disable audible bell
set noerrorbells visualbell t_vb=

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

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
