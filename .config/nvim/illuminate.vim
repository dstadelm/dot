""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"packadd nvim-cursorline
"
"call minpac#add('yamatsum/nvim-cursorline', {'type': 'opt'})

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
packadd vim-illuminate

call minpac#add('RRethy/vim-illuminate', {'type': 'opt'})
au VimEnter * hi! link illuminatedWord CursorLine
let g:Illuminate_highlightUnderCursor = 1

"packadd vim_current_word
"
"call minpac#add('dominikduda/vim_current_word', {'type': 'opt'})
"au VimEnter * hi! link CurrentWordTwins CursorLine
"let g:vim_current_word#highlight_current_word = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
packadd vim-searchlight

call minpac#add('PeterRincker/vim-searchlight', {'type': 'opt'})

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration of the highlight colors
" =====================================
" so $VIMRUNTIME/syntax/hitest.vim
" :silent put =execute('hi Search')
" setting the Searchlight to the original value of (one dark) Search
au VimEnter * hi! Searchlight ctermfg=235 ctermbg=180 guifg=#1e2127 guibg=#E5C07B
" setting the Search highlight group to that of IncSearc
au VimEnter * hi! Search ctermfg=180 ctermbg=59 guifg=#E5C07B guibg=#5C6370
