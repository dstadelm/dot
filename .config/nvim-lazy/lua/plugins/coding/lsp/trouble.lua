local pc = require('plugin_configuration')
return {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    enabled = pc.trouble,
    lazy = true,
    cmd = "Trouble",
    config = true,
  }
