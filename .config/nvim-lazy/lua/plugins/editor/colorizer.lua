return {
  {
    'norcalli/nvim-colorizer.lua',
    enabled = require('config').is_enabled("colorizer"),
    config = function()
      vim.o.termguicolors = true
      require('colorizer').setup()
    end
  }
}
