local pc = require('plugin_configuration')
return {
  'sainnhe/sonokai',
  enabled = pc.sonokai,
  init = function()
    vim.g.sonokai_transparent_background = 0
  end
}
