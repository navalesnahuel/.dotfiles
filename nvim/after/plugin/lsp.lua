local lsp = require('lsp-zero')

lsp.extend_lspconfig()

-- Configure LSP servers
local lspconfig = require('lspconfig')

lspconfig.pyright.setup({
  settings = {
    python = {
      analysis = {
        typeCheckingMode = 'basic',
        autoImportCompletions = true,
      },
    },
  },
})

require("lspconfig").lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

lspconfig.html.setup({})
lspconfig.cssls.setup({})
lspconfig.eslint.setup({})
lspconfig.jsonls.setup({})
lspconfig.bashls.setup({})
lspconfig.dockerls.setup({})
lspconfig.yamlls.setup({})
lspconfig.sqlls.setup({})
lspconfig.marksman.setup({})
lspconfig.ts_ls.setup({})

-- On-attach keymaps
lsp.on_attach(function(_, bufnr)
  local opts = {buffer = bufnr, remap = false}
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
end)

return lsp

