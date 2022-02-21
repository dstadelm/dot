require('telescope').setup{
  defaults = {
    layout_config = {
      prompt_position = "top"
      },
    sorting_strategy = "ascending"
  } ,
  pickers = {
    buffers = {
      ignore_current_buffer = true,
      sort_lastused = true,
    },
  },
}

require'telescope'.load_extension('repo')
require'telescope'.load_extension('file_browser')
