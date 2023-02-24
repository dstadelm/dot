local pc = require('plugin_configuration')
return {
  'nvim-telescope/telescope.nvim',
  enabled = pc.telescope,
  dependencies = {
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    'cljoly/telescope-repo.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    }

  },
  opts = {
    defaults = {
      layout_config = {
        prompt_position = "top"
      },
      sorting_strategy = "ascending",
      path_display = {shorten = 3}, -- hidden, tail, absolute, smart, shorten, truncate
    } ,
    pickers = {
      buffers = {
        ignore_current_buffer = true,
        sort_lastused = true,
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      }
    }
  },
  config = function(plugin, opts)
    require('telescope').setup(opts)
    require('telescope').load_extension('repo')
    require('telescope').load_extension('file_browser')
    require('telescope').load_extension('fzf')
  end,
}
