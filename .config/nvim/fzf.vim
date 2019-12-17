" fast fuzzy search
packadd fzf
call minpac#add('junegunn/fzf', {'type': 'opt'})
packadd fzf.vim
call minpac#add('junegunn/fzf.vim', {'type': 'opt'})
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF configuration 
au FileType fzf set nonu nornu
let $FZF_DEFAULT_OPTS='--layout=reverse'
let g:fzf_layout = { 'window': 'call g:FloatingFZF()' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': 1,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_buf_set_keymap(buf, 'i', '<esc>', ':close!<cr>', {'nowait': v:true})
  call nvim_buf_set_keymap(buf, 'n', '<esc>', ':close!<cr>', {'nowait': v:true})
  call nvim_open_win(buf, v:true, opts)
endfunction

if has("nvim")
  au TermOpen * tnoremap <Esc> <C-\><C-N>
  au FileType fzf tunmap <Esc>
endif
