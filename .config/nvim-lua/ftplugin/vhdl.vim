""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" myquesta is a script that searches for the nearest vunit run.py to the
" file given as argument. Then vunit is executed with questa.
au FileType vhdl setlocal makeprg=myquesta\ %
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The errorformat of modelsim/questa
au FileType vhdl setlocal errorformat=**\ Error:\ %f(%l):\ %m,**\ Warning:\ %f(%l):\ %m
" Riviera error format
"setlocal errorformat=%.%#\ ERROR\ %.%#\ "%m"\ "%f"\ %l\ %c%.%#,%.%#\ WARNING\ %.%#\ "%m"\ "%f"\ %l\ %c%.%#
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neomake configurations only works if neomake is installed and setup
" myquesta/myghdl is a shell script that from the given vhdl file searches
" for the nearest vunit/run.py and runs this with --compile
" The sed is used as for my setup vunit is in a docker container and the git
" repo is mounted.
"
"#!/bin/bash
"
"DIR=$(realpath $(dirname $1))
"while [ ! -z "$DIR" ] && [ ! -f "$DIR/vunit/run.py" ]; do
"    DIR="${DIR%\/*}"
"done
"vunit ${DIR}/vunit/run.py --compile -o myquesta | sed "s#/project#$(git root)#g"
"
" if exists(":Neomake")
" "  autocmd! BufWritePost,BufEnter * NeomakeProject
"   " let g:neomake_verbose = 3
"   call neomake#configure#automake('w', 1000)
" "  let g:vhdl_runpy = VhdlFindRootRunPy()
" "  let g:neomake_vhdl_riviera_maker = {
" "        \ 'exe': 'python',
" "        \ 'args': [g:vhdl_runpy["runpy"], '--compile', '-m'],
" "        \ 'errorformat' : '%.%#\ ERROR\ %.%#\ "%m"\ "%f"\ %l\ %c%.%#,' . '%.%#\ WARNING\ %.%#\ "%m"\ "%f"\ %l\ %c%.%#',
" "        \ 'append_file' : 0,
" "        \ 'cwd' : g:vhdl_runpy["workdir"]
" "        \}
"   let g:neomake_vhdl_myquesta_maker = {
"         \ 'exe': 'myquesta',
"         \ 'args': ['%'],
"         \ 'errorformat' : '**\ Error:\ %f(%l):\ %m,' .'**\ Error (suppressible):\ %f(%l):\ %m,'. '**\ Warning:\ %f(%l):\ %m',
"         \ 'append_file' : 0,
"         \ }
"   let g:neomake_vhdl_myghdl_maker = {
"         \ 'exe': 'myghdl',
"         \ 'args' : ['%'],
"         \ 'errorformat' : '%f:%l:%c:\ %m',
"         \ 'append_file' : 0,
"         \ }
"   let g:neomake_waring_sign = {
"         \ 'text': 'W',
"         \ 'texthl': 'WarningMsg',
"         \ }
"   let g:neomake_error_sign = {
"         \ 'text': 'E',
"         \ 'texthl' : 'ErrorMsg',
"         \ }
"   let g:neomake_vhdl_enabled_makers = ['myquesta'] ", 'myghdl']
" endif

set formatoptions+=ro
set comments+=:--,b:--
