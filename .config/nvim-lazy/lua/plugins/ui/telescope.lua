return {
  'nvim-telescope/telescope.nvim',
  enabled = require('config').is_enabled("telescope"),
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
    -- mappings = {
    --    n = {
    --     ['<C-d>'] = require('telescope.actions').delete_buffer
    --   },
    -- },
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

  config = function(_, opts)
    require('telescope').setup(opts)
    require('telescope').load_extension('repo')
    require('telescope').load_extension('file_browser')
    require('telescope').load_extension('fzf')
  end,
  keys = {
    {"<leader>fb", function() require('telescope.builtin').buffers() end, desc = "Find Buffers"},
    {"<leader>fc", function() require('functions.telescope').find_nvim_config() end, desc = "Find Neovim Config"},
    {"<leader>fd", function() require('telescope.builtin').lsp_document_symbols() end, desc = "Find Document Symbols"},
    {"<leader>ff", function() require('telescope.builtin').find_files({no_ignore = true}) end, desc = "Find Files"},
    {"<leader>fg", function() require('telescope.builtin').live_grep() end, desc = "Grep in Project"},
    {"<leader>fh", function() require('telescope.builtin').help_tags() end, desc = "Find Help"},
    {"<leader>fk", function() require('telescope.builtin').keymaps() end, desc = "Find Keymaps"},
    {"<leader>fl", function() require('telescope.builtin').current_buffer_fuzzy_find() end, desc = "Find in Buffer"},
    {"<leader>fo", function() require('telescope.builtin').oldfiles() end, desc = "Find old files"},
    {"<leader>fp", function() require('functions.telescope').live_grep_in_glob() end, desc = "Grep in files using a glob pattern"},
    {"<leader>fr", function() require('telescope.builtin').lsp_references() end, desc = "Find Reference"},
    {"<leader>ft", function() require('telescope.builtin').colorscheme({enable_preview=true}) end, desc = "Find colorscheme"},
    {"<leader>/",
      function()
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown( {
          winblend = 10,
          previewer = false,})) end,
      desc = "Grep in files using a glob pattern"},
  }
}
