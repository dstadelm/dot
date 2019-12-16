" vim: fdm=marker
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM MyHelp:
" -----------
" :so % 	reload .vimrc | .config/nvim/init.vim
" :helptags ALL to generate documentation
au FileType vim set foldenable

function! s:source_local(relative_path)
  let source_path = expand('%:p:h')
  let full_path = source_path . '/' . a:relative_path
  exec 'source ' . full_path
endfunction

call s:source_local("settings.vim")
call s:source_local("keymaps.vim")
call s:source_local("minpac.vim")
call s:source_local("theme.vim")
call s:source_local("git.vim")
call s:source_local("dispatch.vim")
call s:source_local("neomake.vim")
call s:source_local("you_complete_me.vim")
call s:source_local("snippets.vim")
call s:source_local("fzf.vim")
call s:source_local("rooter.vim")
call s:source_local("easy-align.vim")
call s:source_local("projectionist.vim")
call s:source_local("closetag.vim")
call s:source_local("ack.vim")
call s:source_local("simple-vhdl.vim")
