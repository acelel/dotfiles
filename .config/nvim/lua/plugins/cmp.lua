local cmp = require('cmp');
local luasnip = require('luasnip')
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  mapping = {
    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
    ['<Down>'] = cmp.mapping.select_next_item(select_opts),
    ['<C-Up>'] = cmp.mapping.scroll_docs(-4),
    ['<C-Down>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'buffer', keyword_length = 3 },
  },
  window = {
    documentation = cmp.config.window.bordered()
  },
  formatting = {
    fields = {'menu', 'abbr', 'kind'}
  }
})
