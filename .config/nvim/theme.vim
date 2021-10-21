call minpac#add('ayu-theme/ayu-vim', {'type': 'opt'})
call minpac#add('KeitaNakamura/neodark.vim',  {'type': 'opt'})
call minpac#add('haishanh/night-owl.vim', {'type': 'opt'})
call minpac#add('navarasu/onedark.nvim',  {'type': 'opt'})
call minpac#add('itchyny/lightline.vim', {'type': 'opt'})
call minpac#add('joshdick/onedark.vim',  {'type': 'opt'})
packadd ayu-vim
packadd neodark.vim
packadd night-owl.vim
"packadd onedark.nvim
packadd lightline.vim

packadd onedark.vim

let g:neodark#background = '#1E2127'

" settings for one dark (instead of one half dark)
set termguicolors
let g:onedark_style='darker'
" hint to keep lines short
"set colorcolumn=120
set background=dark

" settings for one dark (instead of one half dark)
let g:one_allow_italics = 1
let g:onedark_terminal_italics = 1
let g:lightline = {
  \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
  \}
let g:onedark_color_overrides = {
  \  "background" : { "gui" : "#1e2127", "cterm" : 235, "cterm16" : 0 }
  \}
colorscheme onedark
