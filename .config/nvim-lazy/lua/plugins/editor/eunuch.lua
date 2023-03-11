local pc = require('plugin_configuration')
return {
  {
    'tpope/vim-eunuch',
    enabled = pc.eunuch,
  }, -- :Rename, :Delete, :Move
}
