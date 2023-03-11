local pc = require('plugin_configuration')
return {
  {
    'norcalli/nvim-colorizer.lua',
    enabled = pc.colorizer,
    config = function()
      vim.o.termguicolors = true
      require('colorizer').setup()
    end
  }
}
