return {
  {
    'rbong/vim-flog',
    dependencies = {
      "tpope/vim-fugitive"
    },
    enabled = require('config').is_enabled("flog"),
    config = function()
      vim.cmd ([[let g:flog_default_opts = { 'max_count': 400} ]])
    end,
  },
}
