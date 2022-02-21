call minpac#add('nvim-lua/popup.nvim'                     , {'type': 'opt'})
call minpac#add('nvim-lua/plenary.nvim'                   , {'type': 'opt'})
call minpac#add('nvim-telescope/telescope.nvim', {'type': 'opt'})
call minpac#add('nvim-telescope/telescope-fzy-native.nvim', {'type': 'opt'})
packadd popup.nvim
packadd plenary.nvim
packadd telescope.nvim
packadd telescope-fzy-native.nvim

lua << EOF
require('telescope').setup{
  defaults = {
    layout_config = {
      prompt_position = "top"
      },
    sorting_strategy = "ascending"
  }
}
require('telescope').load_extension('fzy_native')
EOF

