" fast fuzzy search
packadd fzf
call minpac#add('junegunn/fzf', {'type': 'opt'})
packadd fzf.vim
call minpac#add('junegunn/fzf.vim', {'type': 'opt'})
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF configuration
au FileType fzf set nonu nornu
let $FZF_DEFAULT_OPTS='--layout=reverse'
let g:fzf_preview_window = ''

" if has("nvim")
"   au TermOpen * tnoremap <Esc> <C-\><C-N>
"   au FileType fzf tunmap <Esc>
" endif
