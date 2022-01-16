-- Setting nvim auto-completion options
local utils = require('config.utils')
utils.opt('o', 'completeopt', 'menu,menuone,noselect,noinsert')
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
vim.o.shortmess = vim.o.shortmess .. 'c'

-- Needed for formatting
local lspkind = require('lspkind')
lspkind.init()

-- Setup nvim-cmp.
local cmp = require('cmp')

-- luasnip setup
local luasnip = require('luasnip')

-- nvim-cmp setup
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- for 'luasnip' users
    end,
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
        -- luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
        -- luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'nvim_lua' },
    { name = 'path' },
    { name = 'buffer', keyword_length = 5 },
  },
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer   = "[Buffer]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[API]",
        path     = "[Path]",
        luasnip  = "[Snippet]"
      },
    },
  },
  experimental = {
    native_menu = false,
    ghost_text = true,
  },
})
