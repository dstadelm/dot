packadd vim-easy-align
call minpac#add('junegunn/vim-easy-align', {'type': 'opt'})
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easy Align mappings
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
vnoremap <silent> <Enter> :EasyAlign<CR>
