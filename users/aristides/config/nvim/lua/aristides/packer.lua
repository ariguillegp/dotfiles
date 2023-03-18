-- Install packer
local install_path = vim.fn.stdpath 'data' ..
                         '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' ..
                       install_path)
    vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
    -- Package manager
    use 'wbthomason/packer.nvim'

    use { -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        requires = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            'j-hui/fidget.nvim'
        }
    }

    use { -- Autocompletion
        'hrsh7th/nvim-cmp',
        requires = {
            'onsails/lspkind-nvim', 'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lua', 'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip'
        }
    }
    use {'tzachar/cmp-tabnine', run = './install.sh'}

    use { -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        run = function()
            pcall(require('nvim-treesitter.install').update {with_sync = true})
        end
    }

    use { -- Additional text objects via treesitter
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter'
    }

    -- Git related plugins
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'lewis6991/gitsigns.nvim'
    use 'theprimeagen/git-worktree.nvim'
    use {
        'pwntester/octo.nvim',
        requires = {
            'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim',
            'kyazdani42/nvim-web-devicons'
        }
    }

    -- Undotree
    use 'mbbill/undotree'

    use 'folke/tokyonight.nvim' -- Fancy color scheme
    use { 'nvim-lualine/lualine.nvim', -- Fancier statusline
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
    use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines

    -- Fuzzy Finder (files, lsp, etc)
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        requires = {'nvim-lua/plenary.nvim'}
    }

    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
        cond = vim.fn.executable 'make' == 1
    }

    -- Icons for telescope
    use {'kyazdani42/nvim-web-devicons'}

    -- Handling alternative files nicely
    use 'theprimeagen/harpoon'

    -- Rego integration
    use 'tsandall/vim-rego'
    use 'sbdchd/neoformat'

    -- Extended LSP like features
    use 'jose-elias-alvarez/null-ls.nvim'

    -- If we are bootstrapping these configs, run PackerSync to install all the plugins
    if is_bootstrap then require('packer').sync() end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
    print '=================================='
    print '    Plugins are being installed'
    print '    Wait until Packer completes,'
    print '       then restart nvim'
    print '=================================='
    return
end
