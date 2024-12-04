require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'python', 'lua', 'javascript', 'html', 'css', 'bash', 'yaml', 'json' },
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

}

