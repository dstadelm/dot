require('telescope').setup{
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
}

require'telescope'.load_extension('repo')
require'telescope'.load_extension('file_browser')
require('telescope').load_extension('fzf')

local M = {}

function M.find_nvim_config()
  local opts = {}
  opts.search_dirs = {'~/.config/nvim/'}
  opts.prompt_title = 'Neovim Config Files'
  opts.prompt_prefix = ''
  require'telescope.builtin'.find_files(opts)
end

return M
