return {
  'sainnhe/sonokai',
  enabled = require('config').is_enabled("sonokai"),
  init = function()
    vim.g.sonokai_transparent_background = 0
  end
}
