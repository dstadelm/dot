vim.cmd([[
  au FileType fzf set nonu nornu
  let $FZF_DEFAULT_OPTS='--layout=reverse'
  let g:fzf_preview_window = ''
]])
