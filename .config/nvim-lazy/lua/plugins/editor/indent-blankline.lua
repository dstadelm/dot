local pc = require('plugin_configuration')
return {
  {
    'lukas-reineke/indent-blankline.nvim',
    enabled = pc.indent_blankline,
    config = function()
      vim.cmd([[
                let g:indent_blankline_filetype = ['py',  'yaml']
                let g:indent_blankline_char_list = ['|', '¦', '┆', '┊']
              ]])
    end
  },
  {
    'tommcdo/vim-exchange',
    enabled = pc.exchange,
  },
}
