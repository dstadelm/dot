let g:bclose_no_plugin_maps = 1
let g:no_plugin_maps = 1
packadd bclose.vim
packadd ranger.vim
call minpac#add('francoiscabrol/ranger.vim', {'type': 'opt'})
call minpac#add('rbgrouleff/bclose.vim', {'type': 'opt'})
let g:ranger_replace_netrw = 1
let g:ranger_map_keys = 0
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'
