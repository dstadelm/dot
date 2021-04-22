call minpac#add('svermeulen/vim-yoink', {'type': 'opt'})
packadd vim-yoink

nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

let g:yoinkSavePersistently = 1
let g:yoinkIncludeDeleteOperations = 1

call minpac#add('svermeulen/vim-cutlass', {'type': 'opt'})
packadd vim-cutlass
