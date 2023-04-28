return {
    "folke/trouble.nvim",
    dependencies = {"kyazdani42/nvim-web-devicons"},
    enabled = require('config').is_enabled("trouble"),
    lazy = true,
    cmd = "Trouble",
    config = true,
  }
