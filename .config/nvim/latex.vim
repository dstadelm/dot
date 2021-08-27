call minpac#add('lervag/vimtex', {'type': 'opt'})
packadd vimtex
let g:vimtex_compiler_latexmk = {
        \ 'build_dir' : '',
        \ 'callback' : 1,
        \ 'continuous' : 1,
        \ 'executable' : 'latexmk',
        \ 'hooks' : [],
        \ 'options' : [
        \   '-Werror',
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \   '-r /home/dstadelmann/zf/rfe/documentation/scs/.latexmkrc',
        \ ],
        \}

" let g:vimtex_view_general_viewer = 'qpdfview'
" let g:vimtex_view_general_options = '--unique @pdf\#src:@tex:@line:@col'
" let g:vimtex_view_general_options_latexmk = '--unique'
 let g:vimtex_view_general_viewer = 'okular'
 let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
 let g:vimtex_view_general_options_latexmk = '--unique'
