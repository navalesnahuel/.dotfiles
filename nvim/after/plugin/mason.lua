require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = {
    'pyright', 'html', 'eslint', 'lua_ls',
    'jsonls', 'bashls', 'dockerls', 'yamlls', 'cssls',
    'sqlls', 'marksman', 'bashls'
  },
})

