" Install vim-plug before doing anything
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

" Start plugins installation process
call plug#begin('~/.config/nvim/plugged')
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
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Code completion with CoC LSP Client
Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
" Nice code snippets
Plug 'sirver/ultisnips'
" Syntax checker
Plug 'scrooloose/syntastic'
" Treesitter for better code syntax highlighting
" Language parsers need to be installed independently with TSInstall <lang>
" We recommend updating the parsers on update
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Comment with style
Plug 'scrooloose/nerdcommenter'
" File tree
Plug 'scrooloose/nerdtree'
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
call plug#end()

" Run PlugInstall if there are missing plugins
if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

" Set leader key for future combinations
let mapleader = " "
