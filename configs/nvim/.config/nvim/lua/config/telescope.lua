-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

local utils = require('config.utils')

-- Find files using Telescope command-line sugar.
utils.map('n', '<Leader>ff', '<cmd>Telescope find_files<CR>')
utils.map('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>')
utils.map('n', '<Leader>fb', '<cmd>Telescope buffers<CR>')
utils.map('n', '<Leader>fh', '<cmd>Telescope help_tags<CR>')

-- Fuzzy find git resources
utils.map('n', '<Leader>gf', '<cmd>Telescope git_files<CR>')
utils.map('n', '<Leader>gc', '<cmd>Telescope git_commits<CR>')
utils.map('n', '<Leader>gb', '<cmd>Telescope git_branches<CR>')
