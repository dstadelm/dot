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
set relativenumber               " shows relative numbers
set showmatch                     " show bracket matches
set smartcase                     " when searching using small case letters only the case is ignored
set incsearch                     " show search results as I type
set nowrap                        " don't wrap lines by default
set vb                            " enable visual bell (disable audio bell)
set scrolloff=2                   " minimum lines above/below cursor
set cursorline                    " highlight current line
set nofoldenable                  " disable code folding
set foldmethod=syntax
set wildmode=list:longest,full    
set splitbelow splitright
set inccommand=split
" }}}
" jump to the last position when reopening a file {{{
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" }}}
" persistent undo {{{
set undofile
if isdirectory($HOME . "/.vimundo") == 0
  call mkdir($HOME . "/.vimudo")
endif
set undodir=~/.vimundo
" }}}
" automatically init.vim if  vim files change {{{
autocmd BufWritePost *.vim :source %:p:h/init.vim
" }}}
