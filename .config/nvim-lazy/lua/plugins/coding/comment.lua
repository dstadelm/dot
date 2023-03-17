local pc = require('plugin_configuration')
return {
  {
    'numToStr/Comment.nvim',
    enabled = pc.comment,
    lazy = true,
    config = true,
    keys = {
      {"gcc"},
      {"gc", mode = 'v'}
    }
  },
}
