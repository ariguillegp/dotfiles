-- [[ Setting options ]]
-- See `:help vim.o`

-- [[ Setting options ]]
-- See `:help vim.o`

-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local indent = 2

-- navigation settings
vim.o.scrolloff = 8
vim.o.colorcolumn = "100"

-- set my fat cursor
vim.o.guicursor = ""

-- Set highlight on search
vim.o.hlsearch = false
vim.o.incsearch = true

-- spacing options
vim.o.tabstop = indent
vim.o.softtabstop = indent
vim.o.shiftwidth = indent
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true

-- line wrapping
vim.o.wrap = false

-- Make relative line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- Disable mouse mode
vim.o.mouse = ''

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 50 -- faster completion (4000ms)
vim.wo.signcolumn = 'yes'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- more display options
vim.o.fileencoding = "utf-8"
vim.o.foldenable = false -- show all text unfolded
vim.o.winbar = "%=%m %f"
vim.o.showmode = false
vim.o.splitright = true -- force vertical splits to go to the right
vim.o.cmdheight = 1     -- more space in the nvim cli to display messages
vim.o.hidden = true
vim.o.errorbells = false
vim.o.writebackup = false

-- Indent options
vim.opt.list = true
vim.opt.listchars:append "eol:↴"
