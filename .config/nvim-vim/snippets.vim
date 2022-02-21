packadd ultisnips
call minpac#add('SirVer/ultisnips', {'type': 'opt'})
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = '<C-k>'
let g:UltiSnipsJumpForwardTrigger = '<C-k>' 
let g:UltiSnipsJumpBackwardTrigger = '<C-j>'
" default snippets
packadd vim-snippets
call minpac#add('honza/vim-snippets', {'type': 'opt'})
