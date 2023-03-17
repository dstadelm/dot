local pc = require('plugin_configuration')
return {
  'vimwiki/vimwiki',
  enabled = pc.vimwiki,
  lazy = true,
  ft = "vimwiki",
  keys = {
    { "<leader>ww" }
  },
  config = function()
    vim.cmd([[let g:vimwiki_listsyms = '✗○◐●✓']])
    vim.cmd([[let g:vimwiki_ext2syntax = {'.wiki': 'media'}]])
  end
}
