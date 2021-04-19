call minpac#add('tpope/vim-commentary', {'type': 'opt'})
packadd vim-commentary
augroup MyCommentary
  autocmd!
  autocmd FileType vhdl setlocal commentstring=--\ %s
augroup END
