return {
  "JoosepAlviste/palenightfall.nvim",
  enabled = require('config').is_enabled("palenightfall"),
  lazy = false,
  priority = 1000,
  opts = {
    highlight_overrides = {
      Search = { bg = "#5b5f40" },
      IncSearch = { bg = "#fb3f40" },
    },
  },
  config = true,
}
