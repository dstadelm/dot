packadd LanguageClient-neovim
call minpac#add('autozimu/LanguageClient-neovim', {'type': 'opt', 'do' : {-> system('bash install.sh')}})

" \'vhdl': ['hdl_checker', '--lsp'],
let g:LanguageClient_serverCommands = {
      \'vhdl': ['vhdl-tool', 'lsp'],
      \'tex': ['digestif'],
      \'bib': ['digestif']
      \}
let g:LanguageClient_autoStart = 1
let g:LanguageClient_loggingFile = "/tmp/LanguageClient.log"
let g:LanguageClient_useVirtualText = "No"

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
"au! CursorHold *.vhd  execute ":call LanguageClient_textDocument_hover()"
"au! CursorHold *.vhdl execute ":call LanguageClient_textDocument_hover()"
"set omnifunc=LanguageClient#complete
"set completefunc=LanguageClient#complete
autocmd CompleteDone * pclose!
