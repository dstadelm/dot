packadd simple-vhdl.vim
call minpac#add('dstadelm/simple-vhdl.vim', {'type': 'opt'})
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
nnoremap <leader>vi :VhdlInsertInstanceFromTag<CR>
nnoremap <leader>vr :VhdlRunTestWithFzf<CR>
nnoremap <leader>vg :VhdlRunTestWithFzfInGui<CR>
nnoremap <leader>vl :VhdlUpdateTestList<CR>
nnoremap <leader>vc :VhdlUpdateCtags<CR>
nnoremap <leader>vp :VhdlPasteSignals<CR>
nnoremap <leader>vs :VhdlUpdateSensitivityList<CR>
nnoremap <leader>vb :VhdlBeautify<CR>
