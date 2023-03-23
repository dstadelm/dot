return {
  {
    'lukas-reineke/indent-blankline.nvim',
    enabled = require('config').is_enabled("indent_blankline"),
    config = function()
      vim.cmd([[
                let g:indent_blankline_filetype = ['py',  'yaml']
                let g:indent_blankline_char_list = ['|', '¦', '┆', '┊']
              ]])
    end
  },
  {
    'tommcdo/vim-exchange',
    enabled = require('config').is_enabled("exchange"),
  },
}
