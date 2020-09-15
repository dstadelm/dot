packadd deoplete-tag
call minpac#add('deoplete-plugins/deoplete-tag', {'type': 'opt'})
packadd deoplete.nvim
call minpac#add('Shougo/deoplete.nvim', {'type': 'opt'})
call deoplete#enable()
"inoremap <silent><expr> <TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"let deoplete#tag#cache_limit_size = 100000000
"let g:deoplete#sources = {}
"let g:deoplete#sources._ = ['buffer', 'tag']
"let g:deoplete#auto_complete_start_length = 2

"inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : exists('g:deoplete#_channel_id') ? deoplete#mappings#manual_complete() : "\<C-x>\<C-o>"
let g:deoplete#enable_at_startup = 1
"let g:deoplete#auto_complete_start_length = 2
"let g:deoplete#enable_smart_case = 1
