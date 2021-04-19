packadd indentLine
call minpac#add('Yggdroot/indentLine', {'type': 'opt'})
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_fileType = ['py']

packadd vim-autopep8
call minpac#add('tell-k/vim-autopep8', {'type': 'opt'})
"let g:autopep8_ignore = "E402,W504,E203"
let g:autopep8_max_line_length = 120
let g:autopep8_on_save = 1
let g:autopep8_disable_show_diff = 1
