-- Bear in mind that the Lua API is still fairly beta,
-- and many Vim things don’t have direct interfaces.

-- Map leader to space
vim.g.mapleader = ' '

-- some local variables for better readability
local fn = vim.fn
local execute = vim.api.nvim_command

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
vim.cmd [[packadd packer.nvim]]
-- Auto compile when there are changes in plugins.lua
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

-- Install plugins
require('plugins')

-- Plugin customizations
require('config')
