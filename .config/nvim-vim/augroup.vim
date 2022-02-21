augroup MyAugroup
  autocmd!
  autocmd BufWritePre * silent! %s/\s\+$//e
  autocmd BufWritePost *.vim :source %
  autocmd FileType tex setl suffixesadd+=tex
  " folding for bash
  autocmd FileType sh let g:sh_fold_enabled=3
  autocmd FileType sh let g:is_bash=1
  " jump to the last position when reopening a file
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END
