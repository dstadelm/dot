call minpac#add('nvim-lua/popup.nvim', {'type': 'opt'})
call minpac#add('nvim-lua/plenary.nvim', {'type': 'opt'})
call minpac#add('nvim-telescope/telescope.nvim', {'type': 'opt'})
packadd popup.nvim
packadd plenary.nvim
packadd telescope.nvim

lua << EOF
require('telescope').setup{
  defaults = {
    prompt_position = "top",
    sorting_strategy = "ascending"
  }
}
EOF

augroup DSTelescope
  autocmd!
  autocmd FileType TelescopePrompt call deoplete#custom#buffer_option('auto_complete', v:false)
augroup END
