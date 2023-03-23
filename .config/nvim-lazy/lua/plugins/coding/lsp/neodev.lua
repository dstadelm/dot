return {
  "folke/neodev.nvim",
  name = "neodev",
  enabled = require('config').is_enabled("neodev"),
  lazy = true,
  opts = { experimental = { pathStrict = true } },
  config = true,
}
