return {
  "rafamadriz/neon",
  enabled = require('config').is_enabled("neon"),
  init = function()
    vim.g.neon_style = "default"
    vim.g.neon_transparent = false
  end,
}
