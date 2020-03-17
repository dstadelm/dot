packadd simple-vhdl.vim
call minpac#add('dstadelm/simple-vhdl.vim', {'type': 'opt'})
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
nnoremap <leader>i :VhdlInsertInstanceFromTag<CR>
nnoremap <leader>t :VhdlRunTestWithFzf<CR>
nnoremap <leader>gt :VhdlRunTestWithFzfInGui<CR>
nnoremap <leader>u :VhdlUpdateTestList<CR>
nnoremap <leader>gs :VhdlPasteSignals<CR>
map <F12> :VhdlUpdateSensitivityList<CR>
map <F11> :VhdlBeautify<CR>
