return {
  "folke/neoconf.nvim",
  enabled = require('config').is_enabled("neoconf"),
  lazy = true,
  name = "neoconf",
  cmd = "Neoconf",
  config = true,
}
