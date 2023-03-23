return {
  'B4mbus/oxocarbon-lua.nvim',
  enabled = require('config').is_enabled("oxocarbon"),
  config = function()
    vim.g.oxocarbon_lua_transparent = true
  end
}
