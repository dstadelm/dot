local pc = require('plugin_configuration')
return {
  {
    'mizlan/iswap.nvim',
    enabled = pc.iswap and pc.treesitter,
    lazy = true,
    event = "VeryLazy",
    dependencies = {
      'nvim-treesitter/nvim-treesitter'
    }
  },
}
