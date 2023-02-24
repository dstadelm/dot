local pc = require('plugin_configuration')
return {
  'B4mbus/oxocarbon-lua.nvim',
  enabled = pc.oxocarbon,
  config = function()
    vim.g.oxocarbon_lua_transparent = true
  end
}
