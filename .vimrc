""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim MyHelp:
" -----------
" reload .vimrc 		:so %	


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

""""""""""""""""""""""""""""""""""""""""
" a nice file tree plugin
Plugin 'scrooloose/nerdtree.git'

""""""""""""""""""""""""""""""""""""""""
" Fuzzy file, buffer, mru, tag, etc finder
Plugin 'kien/ctrlp.vim'

""""""""""""""""""""""""""""""""""""""""
" Alternate Files quickly (.c --> .h etc)
Plugin 'a.vim'

""""""""""""""""""""""""""""""""""""""""
" Provides git commands in vim
Plugin 'tpope/vim-fugitive'
""""""""""""""""""""""""""""""""""""""""
" Required to use Gbrowse with bitbucket
Plugin 'tommcdo/vim-fubitive'

Plugin 'vim-latex/vim-latex'

""""""""""""""""""""""""""""""""""""""""
"Plugin 'textobj-user'
" Text objects for entire buffers
"Plugin 'textobj-entire'

" Revies the change history 
"Plugin 'Gundo'

Plugin 'junegunn/vim-easy-align'

" Silversearcher plugin
Plugin 'mileszs/ack.vim'

"Plugin 'johnsyweb/vim-makeshift'
Plugin 'neomake/neomake'
"
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/async.vim'
Plugin 'UltiSnips'
Plugin 'junegunn/gv.vim'
Plugin 'honza/vim-snippets'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'ervandew/supertab'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto       - approve removal
"
" see :h vundle for more details or wiki for FAQ


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp config
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0
" use silver searcher for ctrlp
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" using Ag
let g:ackprg = 'ag --nogroup --nocolor --column'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" allows to switch between buffers without the need of saving the current one
" other values are
" confirm -> vim askes whther to save your changes first
" autowrite or autowriteall -> as the name suggests
set hidden
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Default settings
syntax on                         " show syntax highlighting
filetype plugin indent on
set autoindent                    " set auto indent
set ts=2                          " set indent to 2 spaces
set shiftwidth=2
set expandtab                     " use spaces, not tab characters
set nocompatible                  " don't need to be compatible with old vim
set showmatch                     " show bracket matches
set ignorecase                    " ignore case in search
set hlsearch                      " highlight all search matches
set cursorline                    " highlight current line
set smartcase                     " pay attention to case when caps are used
set incsearch                     " show search results as I type
set mouse=a                       " enable mouse support
set ttimeoutlen=100               " decrease timeout for faster insert with 'O'
set vb                            " enable visual bell (disable audio bell)
set ruler                         " show row and column in footer
set scrolloff=2                   " minimum lines above/below cursor
set laststatus=2                  " always show status bar
"set list listchars=tab:»·,trail:· " show extra space characters
set nofoldenable                  " disable code folding
set foldmethod=syntax
set clipboard=unnamed             " use the system clipboard
set wildmenu                      " enable bash style tab completion
set wildmode=list:longest,full
set backspace=2
set backspace=indent,eol,start
set number relativenumber
set nu rnu
set encoding=utf-8
"set clipboard^=unnamed,unnamedplus " this does not help/work with putty
set splitbelow splitright

runtime macros/matchit.vim        " use % to jump between start/end of methods

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Define a better color scheme which works in the gui and on the console
colorscheme slate
" hint to keep lines short
if exists('+colorcolumn')
  set colorcolumn=120
endif
autocmd ColorScheme * highlight ColorColumn   ctermbg=233
autocmd ColorScheme * highlight ColorColumn   guibg=gray10
autocmd ColorScheme * highlight StatusLine    ctermfg=235 ctermbg=249
autocmd ColorScheme * highlight Search        ctermbg=232
set anti enc=utf-8
set guifont=Source\ Code\ Pro\ 11
set guifont=Monospace\ 11
set guioptions-=T
set background=dark
"highlight CursorLine   term=bold cterm=bold ctermbg=236 ctermfg=251 guifg=white
highlight CursorLine   term=bold cterm=bold ctermbg=236 guifg=white

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status Bar
" ----------
" put useful info in status bar
set statusline=%F%m%r%h%w\ \ [%l,%c]\ [%L,%p%%]
" highlight the status bar when in insert mode
if version >= 700
  au InsertLeave * hi StatusLine ctermfg=235 ctermbg=2
  au InsertEnter * hi StatusLine ctermbg=255 ctermfg=12
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The Silver Searcher
if executable('ag')
 " Use ag over grep
   set grepprg=ag\ --nogroup\ --nocolor

     " Use ag in CtrlP for listing files. Lightning fast and respects
     " .gitignore
       let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set leader key to comma
let mapleader = ","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybindings / Shortcuts
map <leader>P :set paste <cr>
map <leader>p :set nopaste <cr>
" fast access to ctrlp
let g:ctrlp_map = '<leader>f'
" die hash rockets, die!
vnoremap <leader>h :s/:\(\w*\) *=>/\1:/g<cr>
" delete all trailing whitespace in current file
map <leader>w :%s/\s\+$//gce \| w<cr>
" delete all trailing whitespace for each file in repo
map <leader>W :args `git grep -lI .` \| argdo %s/\s\+$//gce \| w<cr>
" map markdown preview
map <leader>m :!open -a Marked %<cr><cr>
" map BufExploerer
map <leader>b :CtrlPBuffer<cr>
" map Q to q and W to w
command! WQ wq
command! Wq wq
command! Q q
command! W w
" open relative to current folder
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>s :vsplit <C-R>=expand("%:p:h") . "/" <CR>
" map Silver Searcher
map <leader>a :Ack!<space>

" Uncomment the following to have Vim jump to the last position when 
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

if has("autocmd")
  filetype on
  autocmd FileType vhdl call Vhdl()
endif

function Vhdl()
  setlocal makeprg=myquesta\ %f
  setlocal errorformat=**\ Error:\ %f(%l):\ %m
  if exists("+omnifunc")
		setlocal omnifunc=syntaxcomplete#Complete
	endif
	let g:vhdl_indent_genportmap=0
  imap <buffer> ,, <= 
  imap <buffer> .. =>
  let g:tlist_vhdl_settings   = 'vhdl;d:package declarations;b:package bodies;e:entities;a:architecture specifications;t:type declarations;p:processes;f:functions;r:procedures'
  " abbreviations
	iabbr dt downto
	iabbr toi to_integer
	iabbr tos to_signed
	iabbr tou to_unsigned
	imap <buffer> I: I : in
	imap <buffer> O: O : out
  " emacs vhdl mode
  " warning: the following is dangerous, because the file is written and then opened again, which means, the undo history is lost; if someting goes wrong, you may loose your file
  command! VhdlUpdateSensitivityList :w|:execute "!cp % %.bak; emacs --no-site-file -batch % -f vhdl-update-sensitivity-list-buffer -f save-buffer" | :e
  map <F12> :VhdlUpdateSensitivityList<CR>
  command! VhdlBeautify :w|:execute "!cp % %.bak; emacs --no-site-file -batch % -f vhdl-beautify-buffer -f save-buffer" | :e
  map <F11> :VhdlBeautify<CR>
  autocmd! BufWritePost,BufEnter * NeomakeProject
endfunction

" search pathes for a.vim
let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc,sfr:../h'

" remap for CtrlPTag
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <F5> :<C-U>MakeshiftBuild<CR>
map ü <C-]>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" power line settings
if !empty(glob("/usr/local/lib/python3.5/dist-packages/powerline/bindings/vim/"))
  set rtp+=/usr/local/lib/python3.5/dist-packages/powerline/bindings/vim/
endif

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
" set t_Co=256

"Full config: when writing or reading a buffer, and on changes in insert and 
" nomral mode (after 500ms; no delay when writing)
call neomake#configure#automake('nrwi', 10)

set tags=tags;/

""" UltiSnips config
"let g:UltiSnipsExpandTrigger="<c-k>"
"let g:UltiSnipsJumpForwardTrigger="<c-k>"
"let g:UltiSnipsJumpBackwardTrigger="<c-j>"
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

:tnoremap <Esc> <C-\><C-N>

let g:entity_end_regex = '\<end\>'
function! VhdlCopyEntityInBuffer()
  let l:start_line = search('entity\s\+\w*\s\+is', "bnWz")
  let l:end_line = search(g:entity_end_regex, "nWz")
  let l:entity_by_line = getline(start_line, end_line)
  call VhdlCopyEntity(l:entity_by_line)
endfunction


function! VhdlCopyEntity(entity_by_line)

  " remove comments 
  call map(a:entity_by_line, {_, val -> substitute(val,'\s*--.*$','','g')})

  let l:entity = join(a:entity_by_line)
  let l:entity = substitute(entity,'\s\{2,}',' ','g') " replace multiple whitespaces by one whitespace
  let l:entity = substitute(entity,'\s',' ','g') " replace singel whithespace character by actual ' '

  let g:vhdl_entity = {}
  let g:vhdl_entity['name'] = trim(substitute(entity,'.*entity\s\+\(\w*\)\s\+is.*', '\1', 'g'))

  let l:generic = substitute(entity,  '.*generic\s*(\(.\{-}\))\s*;\s*port.*', '\1', 'g')
  let s:generics = split(l:generic, ';')
  call map(s:generics, {_, val -> split(val,":")->map({_,v -> trim(v," =")})})

  let l:port = substitute(entity, '.*port\s*(\(.\{-}\))\s*;\s*' . g:entity_end_regex, '\1', 'g')
  let l:port = substitute(port, '\s*\(in\|out\)\s*', ' ', 'g')
  let s:ports = split(l:port, ';')
  call map(s:ports, {_, val -> split(val,":")->map({_,v -> trim(v, " =")})})

  "echomsg l:entity
  "echomsg s:generics
  "echomsg g:vhdl_entity['name']
  "echomsg s:ports
  echomsg "Copied entity " . g:vhdl_entity['name']
endfunction

function! VhdlPasteAsSignals()
  if exists("g:vhdl_entity")
    let format_string = "%-".printf("%ds", VhdlLenLongestStr(s:ports))
    let l:signals = map(copy(s:ports), {_, val -> "signal " .  printf(format_string, val[0]) . " : " .  val[1] . ";"})
    call append(line('.'),signals)
  endif
endfunction

function! VhdlLenLongestStr(mylist)
  let l:max_len = 0
  for item in a:mylist 
    if len(item[0]) > l:max_len 
      let l:max_len = len(item[0])
    endif
  endfor
  return l:max_len
endfunction

function! VhdlPasteAsInstance()
  if exists("g:vhdl_entity")
    let instantiation = ["i_" . g:vhdl_entity['name'] . " : entity work." .  g:vhdl_entity['name']] 
    let format_string = "%-".printf("%ds", VhdlLenLongestStr(s:generics))
    let generic_map = map(copy(s:generics), {_, val -> "    " .  printf(format_string, val[0]) . " => " . val[0] . "," })
    if len(generic_map) > 0
      let generic_map[-1] = trim(generic_map[-1],',') 
      let generic_map = ["  generic map("] + generic_map + [");"] 
    endif
    let format_string = "%-".printf("%ds", VhdlLenLongestStr(s:ports))
    let port_map = map(copy(s:ports), {_, val -> "    " . printf(format_string, val[0]) . " => " . val[0] . "," })
    
    if len(port_map) > 0
      let port_map[-1] = trim(port_map[-1],',')
      let port_map = ["  port map("] + port_map + [");"]
    endif
    let instance = instantiation + generic_map + port_map
    call append(line('.'), instance)
  endif
endfunction

function! VhdlInsertInstanceFromTag()
  let tags = taglist()
endfunction

command! VhdlCopyEntity call VhdlCopyEntityInBuffer()
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
vnoremap <silent> <Enter> :EasyAlign<CR>

let g:ctrlp_extensions = ['sample']
command! CtrlPSample call ctrlp#init(ctrlp#sample#id())
