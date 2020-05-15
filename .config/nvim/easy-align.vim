packadd vim-easy-align
call minpac#add('junegunn/vim-easy-align', {'type': 'opt'})
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easy Align mappings
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
vnoremap <silent> <Enter> :EasyAlign<CR>

inoremap <silent> & &<Esc>: call <SID>ampalign()<CR>a

function! s:ampalign()
  let p = '^\s*&\s.*\s&\s*$'
  if exists(':EasyAlign') && getline('.') =~# '^\s*&' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    EasyAlign*&
    normal! 0
    call search(repeat('[^&]*&',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
