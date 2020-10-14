call minpac#add('justinmk/vim-dirvish', {'type': 'opt'})
call minpac#add('kristijanhusak/vim-dirvish-git', {'type': 'opt'})
packadd vim-dirvish
packadd vim-dirvish-git

  let g:dirvish_git_indicators = {
  \ 'Modified'  : '✹',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Unknown'   : '?'
  \ }
