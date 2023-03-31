-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Set color theme
vim.cmd[[colorscheme tokyonight-night]]

-- Set color column
vim.api.nvim_set_hl(0, "ColorColumn", {ctermbg = 0, bg = "#323953"})
