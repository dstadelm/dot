local pc = require("plugin_configuration")
return {
  "JoosepAlviste/palenightfall.nvim",
  enabled = pc.palenightfall,
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
