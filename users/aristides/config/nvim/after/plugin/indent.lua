vim.opt.list = true
vim.opt.listchars:append "eol:↴"

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
  show_end_of_line = true,
}
