call minpac#add('ayu-theme/ayu-vim', {'type': 'opt'})
call minpac#add('KeitaNakamura/neodark.vim',  {'type': 'opt'})
call minpac#add('haishanh/night-owl.vim', {'type': 'opt'})
call minpac#add('navarasu/onedark.nvim',  {'type': 'opt'})
call minpac#add('itchyny/lightline.vim', {'type': 'opt'})
packadd ayu-vim
packadd neodark.vim
packadd night-owl.vim
packadd onedark.nvim
packadd lightline.vim

" settings for one dark (instead of one half dark)
set termguicolors
let g:onedark_style='warmer'
colorscheme onedark
" hint to keep lines short
set colorcolumn=120
set background=dark

