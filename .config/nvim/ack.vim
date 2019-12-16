packadd ack.vim
call minpac#add('mileszs/ack.vim', {'type': 'opt'})
let g:ackprg = 'rg --vimgrep --no-heading'
nnoremap <leader>a :Ack!<space>
