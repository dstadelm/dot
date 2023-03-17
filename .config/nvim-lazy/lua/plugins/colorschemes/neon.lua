local pc = require("plugin_configuration")
return {
  "rafamadriz/neon",
  enabled = pc.neon,
  init = function()
    vim.g.neon_style = "default"
    vim.g.neon_transparent = false
  end,
}
