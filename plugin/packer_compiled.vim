" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/aristides/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/aristides/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/aristides/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/aristides/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/aristides/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ale = {
    loaded = true,
    path = "/home/aristides/.local/share/nvim/site/pack/packer/start/ale"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/home/aristides/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/home/aristides/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  indentLine = {
    loaded = true,
    path = "/home/aristides/.local/share/nvim/site/pack/packer/start/indentLine"
  },
  ["lightline.vim"] = {
    loaded = true,
    path = "/home/aristides/.local/share/nvim/site/pack/packer/start/lightline.vim"
  },
  ["logstash.vim"] = {
    loaded = true,
    path = "/home/aristides/.local/share/nvim/site/pack/packer/start/logstash.vim"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/aristides/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/aristides/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/aristides/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/aristides/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/aristides/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/aristides/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/aristides/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/aristides/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/aristides/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  ["vim-autoformat"] = {
    loaded = true,
    path = "/home/aristides/.local/share/nvim/site/pack/packer/start/vim-autoformat"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/aristides/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-go"] = {
    loaded = true,
    path = "/home/aristides/.local/share/nvim/site/pack/packer/start/vim-go"
  },
  ["vim-kubernetes"] = {
    loaded = true,
    path = "/home/aristides/.local/share/nvim/site/pack/packer/start/vim-kubernetes"
  },
  ["vim-man"] = {
    loaded = true,
    path = "/home/aristides/.local/share/nvim/site/pack/packer/start/vim-man"
  },
  ["vim-rego"] = {
    loaded = true,
    path = "/home/aristides/.local/share/nvim/site/pack/packer/start/vim-rego"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
