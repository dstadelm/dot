return {
  'glepnir/lspsaga.nvim',
  lazy = true,
  event = {"LspAttach"},
  enabled = require('config').is_enabled("lspsaga"),
}
