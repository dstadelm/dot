local pc = require('plugin_configuration')
return {
  {
    'kylechui/nvim-surround',
    enabled = pc.surround,
    config = true,
  },
}
