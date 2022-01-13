return require('packer').startup(function()

    -- Packer can manage itself as an optional plugin
    use 'wbthomason/packer.nvim'

    -- Telescope
    use { 'nvim-telescope/telescope.nvim',
      requires = {
        { 'nvim-lua/popup.nvim' },
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
        { 'kyazdani42/nvim-web-devicons' },
        { 'nvim-telescope/telescope-file-browser.nvim' }
      }
    }

    -- Color scheme
    use 'gruvbox-community/gruvbox'

    -- Git Worktrees
    use 'ThePrimeagen/git-worktree.nvim'

    -- Fugitive for Git
    use 'tpope/vim-fugitive'
    -- Add git related info in the signs columns and popups
    use { 'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' }
    }

    -- Vim surround
    use 'tpope/vim-surround'

    -- Status line
    use 'itchyny/lightline.vim'

    -- Some help
    use 'vim-utils/vim-man'

    -- LSP and completion
    -- Language servers need to be installed
    -- with :LspInstall <lang> and the client needs to be
    -- attached to them, check :h lsp
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use { 'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-nvim-lsp',
        'onsails/lspkind-nvim',
        'saadparwaiz1/cmp_luasnip',
        'L3MON4D3/LuaSnip'
      }
    }

    -- Treesitter for better code syntax highlighting
    -- Language parsers need to be installed independently with TSInstall <lang>
    -- We recommend updating the parsers on update
    use { 'nvim-treesitter/nvim-treesitter', run= ':TSUpdate'}
    -- Additional textobjects for treesitter
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    -- Snippets and integration with k8s
    use 'andrewstuart/vim-kubernetes'

    -- Show me indentantion marks
    use 'Yggdroot/indentLine'

    -- ALE (Asynchronous Lint Engine)
    use 'dense-analysis/ale'

    -- Rego syntax support
    use 'tsandall/vim-rego'
    use 'sbdchd/neoformat'

    -- Logstash syntax support
    use 'robbles/logstash.vim'
end)
