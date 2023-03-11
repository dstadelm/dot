local pc = require('plugin_configuration')
return {
  {
    'tpope/vim-vinegar',
    enabled = pc.vinegar,
  }, -- changes netrw behaviour press I to see default netrw, gh for toggling hideing
}
