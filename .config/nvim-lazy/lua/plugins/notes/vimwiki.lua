return {
  'vimwiki/vimwiki',
  enabled = require('config').is_enabled("vimwiki"),
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
