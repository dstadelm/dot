local pc = require('plugin_configuration')
return {
  {
    'rbong/vim-flog',
    enabled = pc.flog,
    config = function()
      vim.cmd ([[let g:flog_default_opts = { 'max_count': 400} ]])
    end,
  },
}
