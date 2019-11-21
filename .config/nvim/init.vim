"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM MyHelp:
" -----------
" :so % 	reload .vimrc | .config/nvim/init.vim
" :helptags ALL to generate documentation
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})
command! PackUpdate call minpac#update()
command! PackClean  call minpac#clean()

" neovim colorschemes
call minpac#add('rakr/vim-one')
call minpac#add('ayu-theme/ayu-vim')

" plugins for git
call minpac#add('junegunn/gv.vim')
call minpac#add('tpope/vim-fugitive')

" plugins for linting and making
call minpac#add('neomake/neomake')
" plugins for completion
call minpac#add('ycm-core/YouCompleteMe')
" snippet machine
call minpac#add('SirVer/ultisnips')
" default snippets
call minpac#add('honza/vim-snippets')
" supertab handles ycm and ultisnips
call minpac#add('ervandew/supertab')
" fast fuzzy searc
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')

call minpac#add('airblade/vim-rooter')

call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')

call minpac#add('dstadelm/simple-vhdl.vim')
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Define a better color scheme which works in the gui and on the console
let g:airline_theme='onedark'
set termguicolors
" colorscheme slate
" colorscheme ayu
colorscheme one
" hint to keep lines short
set colorcolumn=120
set background=dark
" end of color customisation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ","
" opening files relative to the current file 
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" opening files in vertical split relative to current file
nnoremap <leader>s :vsplit <C-R>=expand("%:p:h") . "/" <CR>
" remap <C-]> as it does not work in putty and wsl terminal
nnoremap ü <C-]>
nnoremap <leader>P :set paste <cr>
nnoremap <leader>p :set nopaste <cr>
" delete all trailing whitespace in current file
map <leader>w :%s/\s\+$//gce \| w<cr>
" delete all trailing whitespace for each file in repo
map <leader>W :args `git grep -lI .` \| argdo %s/\s\+$//gce \| w<cr>
" make mappings using abbreviation for accidental capital quit/write-quit
" the reason is that on swiss keyboards : has to be entered with shift
cabbrev Q q
cabbrev W w
cabbrev Wq wq
" fuzzy finding
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :Files<CR>

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
set number relativenumber         " line of cursor shows actual line number
set showmatch                     " show bracket matches
set smartcase                     " when searching using small case letters only the case is ignored
set nowrap                        " don't wrap lines by default
set incsearch                     " show search results as I type
set vb                            " enable visual bell (disable audio bell)
set scrolloff=2                   " minimum lines above/below cursor
set cursorline                    " highlight current line
set nofoldenable                  " disable code folding
set foldmethod=syntax
set clipboard+=unnamedplus        " always use clipboard for all operations instead of interacting with + and/or * registers explicitly
set wildmode=list:longest,full    
set splitbelow splitright

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=%F%m%r%h%w\ \ [%l,%c]\ [%L,%p%%]
" highlight status line in blue when in insert mode
au InsertLeave * hi StatusLine ctermfg=235 ctermbg=2
au InsertEnter * hi StatusLine ctermbg=255 ctermfg=12
" jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" settings so that tab works with ycm and ultisnips
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easy Align mappings
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
vnoremap <silent> <Enter> :EasyAlign<CR>
set runtimepath+='~/vhdl-simplified'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF configuration stuff
au FileType fzf set nonu nornu
let $FZF_DEFAULT_OPTS='--layout=reverse'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': 1,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Terminal mappings

:tnoremap <Esc> <C-\><C-N>
