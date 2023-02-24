local pc = require('plugin_configuration')
return {
  'rafamadriz/neon',
  enabled = pc.neon,
  config = function()
    -- vim.g.neon_style = "doom"
    vim.g.neon_transparent = true
  end
}
