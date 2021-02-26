" Install vim-plug before doing anything
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

" Start plugins installation process
call plug#begin('~/.vim/plugged')
" Telescope plugins
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
" Awesome theme
Plug 'gruvbox-community/gruvbox'
" Git
Plug 'tpope/vim-fugitive'
" Status line
Plug 'vim-airline/vim-airline'
" Undotree
Plug 'mbbill/undotree'
" Some help
Plug 'vim-utils/vim-man'
" Go development
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'}
" Nice code snippets
Plug 'sirver/ultisnips'
" Syntax checker
Plug 'scrooloose/syntastic'
" Select your window nicely
Plug 't9md/vim-choosewin'
" Comment with style
Plug 'scrooloose/nerdcommenter'
" Snippets and integration with k8s
Plug 'andrewstuart/vim-kubernetes'
" Show me indentantion marks
Plug 'Yggdroot/indentLine'
" ALE (Asynchronous Lint Engine)
Plug 'dense-analysis/ale'
" Rego syntax support
Plug 'tsandall/vim-rego'
" Logstash syntax support
Plug 'robbles/logstash.vim'
" Autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

" Run PlugInstall if there are missing plugins
if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

" Set leader key for future combinations
let mapleader = " "

"---------------------------------------------
" Misc Autocommands
"---------------------------------------------

fun! TrimWhitespace()
	let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup TRIMTRIMTRIM
  autocmd!
  autocmd BufWritePre * :call TrimWhitespace()
augroup END

" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END
