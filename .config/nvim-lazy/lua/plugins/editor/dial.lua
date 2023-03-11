local pc = require('plugin_configuration')
return{
  'monaqa/dial.nvim',
  enabled = pc.dial,
  keys = {
    {"<C-a>" , function () require("dial.map").inc_normal()  end, "n", desc = "Dial increment"},
    {"<C-x>" , function () require("dial.map").dec_normal()  end, "n", desc = "Dial decrement"},
    {"<C-a>" , function () require("dial.map").inc_visual()  end, "v", desc = "Dial increment"},
    {"<C-x>" , function () require("dial.map").dec_visual()  end, "v", desc = "Dial decrement"},
    {"g<C-a>", function () require("dial.map").inc_gvisual() end, "v", desc = "Dial increment"},
    {"g<C-x>", function () require("dial.map").dec_gvisual() end, "v", desc = "Dial decrement"},
  }
}
