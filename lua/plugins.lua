return require('packer').startup(function()

    -- Packer can manage itself as an optional plugin
    use 'wbthomason/packer.nvim'

    -- Telescope
    use { 'nvim-telescope/telescope.nvim',
          requires = {
          { 'nvim-lua/popup.nvim' },
          { 'nvim-lua/plenary.nvim' },
          { 'nvim-telescope/telescope-fzy-native.nvim' }
    }}

    -- Color scheme
    use 'gruvbox-community/gruvbox'

    -- Fugitive for Git
    use 'tpope/vim-fugitive'

    -- Vim surround
    use 'tpope/vim-surround'

    -- Status line
    use 'itchyny/lightline.vim'

    -- Some help
    use 'vim-utils/vim-man'

    -- Go development
    use { 'fatih/vim-go', run = ':GoUpdateBinaries' }

    -- LSP and completion
    -- Language servers need to be installed
    -- with :LspInstall <lang> and the client needs to be
    -- attached to them, check :h lsp
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'
    use 'kabouzeid/nvim-lspinstall'

    -- Treesitter for better code syntax highlighting
    -- Language parsers need to be installed independently with TSInstall <lang>
    -- We recommend updating the parsers on update
    use { 'nvim-treesitter/nvim-treesitter', run= ':TSUpdate'}

    -- Snippets and integration with k8s
    use 'andrewstuart/vim-kubernetes'

    -- Show me indentantion marks
    use 'Yggdroot/indentLine'

    -- ALE (Asynchronous Lint Engine)
    use 'dense-analysis/ale'

    -- Rego syntax support
    use 'tsandall/vim-rego'
    use 'Chiel92/vim-autoformat'

    -- Logstash syntax support
    use 'robbles/logstash.vim'

    -- Ultisnips are awesome
    use 'sirver/ultisnips'
end)
