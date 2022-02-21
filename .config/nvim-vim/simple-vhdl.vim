call minpac#add('dstadelm/simple-vhdl.vim', {'type': 'opt'})
packadd simple-vhdl.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
nnoremap <leader>vi :VhdlInsertInstanceFromTag<CR>
nnoremap <leader>vc :VhdlUpdateCtags<CR>
nnoremap <leader>vp :VhdlPasteSignals<CR>
nnoremap <leader>vs :VhdlUpdateSensitivityList<CR>
nnoremap <leader>vb :VhdlBeautify<CR>

let g:VunitInvocationCmd = 'vunit'
let g:VunitGuiPreCmd = 'export $(tmux show-env | grep DISP);'
packadd vim-vunit
call minpac#add('dstadelm/vim-vunit', {'type': 'opt'})
nnoremap <leader>vr :VunitRunTestWithFzf<CR>
nnoremap <leader>vg :VunitRunTestWithFzfInGui<CR>
nnoremap <leader>vl :VunitUpdateTestList<CR>
nnoremap <leader>rr :VunitReRunSelectedTests<CR>

