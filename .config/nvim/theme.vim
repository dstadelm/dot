" has to be set first as it does not have effect otherwise
let g:airline_powerline_fonts = 1
packadd vim-airline
call minpac#add('vim-airline/vim-airline', {'type': 'opt'})
packadd vim-airline-themes
call minpac#add('vim-airline/vim-airline-themes', {'type': 'opt'})
packadd ayu-vim
call minpac#add('ayu-theme/ayu-vim', {'type': 'opt'})
packadd onedark.vim
call minpac#add('joshdick/onedark.vim',  {'type': 'opt'})
packadd night-owl.vim
call minpac#add('haishanh/night-owl.vim', {'type': 'opt'})

let g:onedark_color_overrides = {
      \  "black" : { "gui" : "#1e2127", "cterm" : 235, "cterm16" : 0 }
      \}


" settings for one dark (instead of one half dark)
"let g:airline_theme='one'
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1
set termguicolors
colorscheme onedark
"colorscheme night-owl
" hint to keep lines short
set colorcolumn=120
set background=dark
" set statusline=%F%m%r%h%w\ \ [%l,%c]\ [%L,%p%%]
" highlight status line in blue when in insert mode
" au InsertLeave * hi StatusLine ctermfg=235 ctermbg=2
" au InsertEnter * hi StatusLine ctermbg=255 ctermfg=12
