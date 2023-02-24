local pc = require('plugin_configuration')
return {
  {
    "briones-gabriel/darcula-solid.nvim",
    enabled = pc.darcula,
    dependencies = { "rktjmp/lush.nvim" }
  }
}
