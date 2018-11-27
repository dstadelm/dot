""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim MyHelp:
" -----------
" reload .vimrc 		:so %	
" reload .vimrc			:so $MYVIMRC


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
Plugin 'fugitive.vim'

""""""""""""""""""""""""""""""""""""""""
Plugin 'textobj-user'
" Text objects for entire buffers
Plugin 'textobj-entire'

" Text objects for ruby blocks
Plugin 'textobj-rubyblock'

" Revies the change history 
Plugin 'Gundo'

Plugin 'align'

" Silversearcher plugin
Plugin 'ag.vim'

Plugin 'johnsyweb/vim-makeshift'
"
Plugin 'gitv'
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
" autocompletion 
filetype plugin on
set omnifunc=syntaxcomplete#Complete

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
set clipboard=unnamed             " use the system clipboard
set wildmenu                      " enable bash style tab completion
set wildmode=list:longest,full
set backspace=2
set backspace=indent,eol,start
set nu
runtime macros/matchit.vim        " use % to jump between start/end of methods

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Define a better color scheme which works in the gui and on the console
colorscheme slate
" hint to keep lines short
if exists('+colorcolumn')
  set colorcolumn=80
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
" map git commands
map <leader>l :!clear && git log -p %<cr>
map <leader>d :!clear && git diff %<cr>
" map Q to q and W to w
command! WQ wq
command! Wq wq
command! Q q
command! W w
" check code complexity
map <leader>x :!clear && flog %<cr>
" open relative to current folder
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>s :vsplit <C-R>=expand("%:p:h") . "/" <CR>
" map Silver Searcher
map <leader>a :Ag!<space>

" Uncomment the following to have Vim jump to the last position when 
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

"The following will map <Tab> to either actually insert a <Tab> if
"the current line is currently only whitespace, or start/continue a CTRL-N
"completion operation: >
function! CleverTab()
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    return "\<Tab>"
  else
    return "\<C-N>"
  endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

if has("autocmd")
  filetype on
  autocmd FileType vhdl call Vhdl()
endif

function Vhdl()
  setlocal errorformat=**\ Error:\ %f(%l):\ %m
  imap <buffer> ,, <= 
  imap <buffer> .. => 
  " emacs vhdl mode
  " warning: the following is dangerous, becase the file is written and then opened again, which means, the undo history is lost; if someting goes wrong, you may loose your file
  command! VhdlUpdateSensitivityList :w|:execute "!cp % %.bak; emacs --no-site-file -batch % -f vhdl-update-sensitivity-list-buffer -f save-buffer" | :e
  map <F12> :VhdlUpdateSensitivityList<CR>
  command! VhdlBeautify :w|:execute "!cp % %.bak; emacs --no-site-file -batch % -f vhdl-beautify-buffer -f save-buffer" | :e
  map <F11> :VhdlBeautify<CR>
endfunction

" search pathes for a.vim
let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc,sfr:../h'

" remap for CtrlPTag
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <F5> :<C-U>MakeshiftBuild<CR>
