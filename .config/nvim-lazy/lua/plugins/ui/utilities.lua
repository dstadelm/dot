return {
  {
    'caenrique/nvim-maximize-window-toggle',
    enabled = require('config').is_enabled("maximize_window_toggle"),
  },
  {
    'yuttie/comfortable-motion.vim',
    enabled = require('config').is_enabled("floaterm"),
  },
  {
    'rcarriga/nvim-notify',
    enabled = require('config').is_enabled("notify"),
    lazy = true,
    event = "VeryLazy",
    opts = {
     background_colour = "#1e2127",
    },
    config = true,
  },
  {
    "folke/noice.nvim",
    enabled = require('config').is_enabled("noice"),
    config = function()
      require("noice").setup({
        -- add any options here
      })
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },
  {
    'goolord/alpha-nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    enabled = require('config').is_enabled("alpha"),
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end
  },
}
