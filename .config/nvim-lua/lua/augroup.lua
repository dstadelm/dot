vim.cmd([[
let blacklist = ['gitcommit']
augroup MyAugroup
  autocmd!
  autocmd BufWritePre * silent! %s/\s\+$//e
  autocmd BufWritePost *.vim :source %
  autocmd BufWritePost *.lua :source %
  autocmd FileType tex setl suffixesadd+=tex
  autocmd FileType sh let g:is_bash=1
  " jump to the last position when reopening a file
  autocmd BufReadPost * if index(blacklist, &ft) < 0 && line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=400}
augroup END

augroup MyCommentary
  autocmd!
  autocmd FileType vhdl setlocal commentstring=--\ %s
augroup END

]])
