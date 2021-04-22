"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM MyHelp:
" -----------
" :so % 	reload .vimrc | .config/nvim/init.vim
" :helptags ALL to generate documentation
au FileType vim set foldenable

function! s:source_local(relative_path)
  let full_path = stdpath('config') . '/' . a:relative_path
  exec 'source ' . full_path
endfunction

let mapleader = ","
call s:source_local("minpac.vim")
call s:source_local("settings.vim")
call s:source_local("augroup.vim")
call s:source_local("commentary.vim")
call s:source_local("git.vim")
call s:source_local("keymaps.vim")
call s:source_local("neomake.vim")
call s:source_local("completion.vim")
call s:source_local("lsp.vim")
call s:source_local("treesitter.vim")
call s:source_local("telescope.vim")
call s:source_local("snippets.vim")
call s:source_local("fzf.vim")
call s:source_local("floaterm.vim")
call s:source_local("rooter.vim")
call s:source_local("easy-align.vim")
call s:source_local("projectionist.vim")
call s:source_local("ack.vim")
call s:source_local("undo.vim")
call s:source_local("goyo.vim")
call s:source_local("surround.vim")
call s:source_local("autopairs.vim")
call s:source_local("eunuch.vim")
call s:source_local("vinegar.vim")
call s:source_local("vimwiki.vim")
call s:source_local("markdown-preview.vim")
call s:source_local("grammarous.vim")
call s:source_local("highlighted_yank.vim")
call s:source_local("theme.vim")
call s:source_local("scrolling.vim")
call s:source_local("figlet.vim")
call s:source_local("startify.vim")
call s:source_local("simple-vhdl.vim")
call s:source_local("python.vim")
call s:source_local("illuminate.vim")
call s:source_local("anyjump.vim")
call s:source_local("yoink.vim")
call s:source_local("exchange.vim")


highlight Comment cterm=italic gui=italic
"hi! link CurrentWordTwins Visual
"hi! link CurrentWord Visual
"hi Search cterm=NONE ctermbg=blue ctermfg=black
"hi IncSearch cterm=NONE ctermbg=magenta ctermfg=black
"hi Search gui=NONE guibg=blue guifg=black
"hi IncSearch gui=NONE guibg=magenta guifg=black
"
"
"call s:source_local("Ranger.vim")
"call s:source_local("dispatch.vim")
"call s:source_local("you_complete_me.vim")
"call s:source_local("closetag.vim")
"call s:source_local("vim-closer.vim")
"call s:source_local("vim-endwise.vim")
