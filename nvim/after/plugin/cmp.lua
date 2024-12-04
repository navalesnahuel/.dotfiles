local cmp = require('cmp')
local lsp = require('lsp-zero')

local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({

    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({select = true}),
    ['<Tab>'] = cmp.mapping(function(fallback)

    if cmp.visible() then
      cmp.select_next_item()
    else
      fallback()
    end
  end, { 'i', 's' }),
  ['<S-Tab>'] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    else
      fallback()
    end
  end, { 'i', 's' }),
})

-- CMP setup
cmp.setup({
  mapping = cmp_mappings,
  sources = cmp.config.sources({
    {name = 'nvim_lsp'},
    {name = 'luasnip'},
    {name = 'buffer'},
    {name = 'path'},
  }),
})

