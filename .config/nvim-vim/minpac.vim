packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})
command! PackUpdate call minpac#update()
command! PackClean  call minpac#clean()
