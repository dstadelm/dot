packadd YouCompleteMe
call minpac#add('ycm-core/YouCompleteMe', {'type': 'opt'})
let g:ycm_collect_identifiers_from_tags_files = 1
"let g:ycm_language_server = 
"      \[
"      \   {
"      \     'name': 'vhdl',
"      \     'cmdline': [ 'vhdl-tool', 'lsp' ],
"      \     'filetypes': [ 'vhdl' ],
"      \     'project_root_files': [ 'vhdltool-config.yaml' ]
"      \   }
"      \]
let g:ycm_language_server = [
      \   {
      \     'name': 'digestif',
      \     'cmdline': [ 'digestif' ],
      \     'filetypes': [ 'tex', 'bib' ],
      \     'project_root_files': [ '.latexmkrc' ]
      \   }
      \]
