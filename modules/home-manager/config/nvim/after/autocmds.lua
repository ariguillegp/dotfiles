-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({
      highlight_group = 'IncSearch',
      timeout = 50,
    })
  end,
  group = highlight_group,
  pattern = '*',
})

-- trim extra leading/trailing whitespaces on file save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = vim.api.nvim_create_augroup("TrimSpaces", { clear = true }),
  pattern = "*",
  command = "%s/\\s\\+$//e",
})
