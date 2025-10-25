require('nvim-treesitter.configs').setup({
  ensure_installed = { 
    'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 
    'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'rust' 
  },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    custom_captures = {
      ['variable'] = 'TSVariable',
      ['variable.builtin'] = 'TSVariableBuiltin',
    },
  },
  indent = { enable = true, disable = { 'ruby' } },
})
