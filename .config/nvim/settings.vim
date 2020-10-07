" vim: fdm=marker
" settings  {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" allows to switch between buffers without the need of saving the current one
" other values are: confirm, autowrite, autowriteall
set hidden
" on defines autocommands, plugin loads filtype specific plugins, indent loads
" filetype specific indentations
filetype plugin indent on
set ts=2                          " set indent to 2 spaces
set shiftwidth=2                  " set shift to 2 spaces (introduced by < and >)
set expandtab                     " use spaces, not tab characters
set number                        " shows numbers
set relativenumber                " shows relative numbers
set showmatch                     " show bracket matches
set ignorecase                    " has to be enabled to make smartcase work, as smartcase overrides this option
set smartcase                     " when searching using small case letters only the case is ignored
set incsearch                     " show search results as I type
set nowrap                        " don't wrap lines by default
set vb                            " enable visual bell (disable audio bell)
set scrolloff=2                   " minimum lines above/below cursor
" set cursorline makes scrolling in putty very slow
set cursorline                    " highlight current line
set foldenable                    " code folding
set foldmethod=syntax
set wildmode=list:longest,full    
set splitbelow splitright
set inccommand=split
set noshowmode                    " do not show in which mode we are, as this is shown by airline
" }}}
" jump to the last position when reopening a file {{{
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" }}}
" persistent undo {{{
set undofile
if isdirectory($HOME . "/.vimundo") == 0
  call mkdir($HOME . "/.vimundo")
endif
set undodir=~/.vimundo
" }}}
" automatically init.vim if  vim files change {{{
autocmd BufWritePost *.vim :source %
" }}}
autocmd FileType tex setl suffixesadd+=tex

" folding for bash
au FileType sh let g:sh_fold_enabled=3
au FileType sh let g:is_bash=1
