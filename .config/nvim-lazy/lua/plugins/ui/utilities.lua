local pc = require('plugin_configuration')
return {
  {
    'caenrique/nvim-maximize-window-toggle',
    enabled = pc.maximize_window_toggle,
  },
  {
    'yuttie/comfortable-motion.vim',
    enabled = pc.floaterm,
  },
  {
    'rcarriga/nvim-notify',
    enabled = pc.notify,
    lazy = false,
    opts = {
     background_colour = "#1e2127",
    },
    config = true,
  },
  {
    "folke/noice.nvim",
    enabled = pc.noice,
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
    enabled = pc.alpha,
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end
  },
}
