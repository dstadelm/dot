" vim: fdm=marker
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM MyHelp:
" -----------
" :so % 	reload .vimrc | .config/nvim/init.vim
" :helptags ALL to generate documentation
au FileType vim set foldenable
" plugins {{{
" minpac {{{
packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})
command! PackUpdate call minpac#update()
command! PackClean  call minpac#clean()
" }}}
" color scheme and airline {{{
packadd vim-airline
call minpac#add('vim-airline/vim-airline', {'type': 'opt'})
packadd vim-airline-themes
call minpac#add('vim-airline/vim-airline-themes', {'type': 'opt'})
packadd vim-one
call minpac#add('rakr/vim-one', {'type': 'opt'})
packadd ayu-vim
call minpac#add('ayu-theme/ayu-vim', {'type': 'opt'})
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1
set termguicolors
"colorscheme ayu
colorscheme one
" hint to keep lines short
set colorcolumn=120
set background=dark
" set statusline=%F%m%r%h%w\ \ [%l,%c]\ [%L,%p%%]
" highlight status line in blue when in insert mode
" au InsertLeave * hi StatusLine ctermfg=235 ctermbg=2
" au InsertEnter * hi StatusLine ctermbg=255 ctermfg=12
" }}}
" git {{{
packadd gv.vim
call minpac#add('junegunn/gv.vim', {'type': 'opt'})
packadd vim-fugitive
call minpac#add('tpope/vim-fugitive', {'type': 'opt'})
" git in the gutter and configuration
packadd vim-gitgutter
call minpac#add('airblade/vim-gitgutter', {'type': 'opt'})
set updatetime=100
"}}}
" dispatch {{{
packadd vim-dispatch
call minpac#add('tpope/vim-dispatch', {'type': 'opt'})
" }}}
" linting / making {{{
packadd neomake
call minpac#add('neomake/neomake', {'type': 'opt'})
" }}}
" completion {{{ 
packadd YouCompleteMe
call minpac#add('ycm-core/YouCompleteMe', {'type': 'opt'})
" }}}
" snippets {{{
packadd ultisnips
call minpac#add('SirVer/ultisnips', {'type': 'opt'})
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = '<C-k>'
let g:UltiSnipsJumpForwardTrigger = '<C-k>' 
let g:UltiSnipsJumpBackwardTrigger = '<C-j>'
" default snippets
packadd vim-snippets
call minpac#add('honza/vim-snippets', {'type': 'opt'})
" }}}
" FZF {{{
" fast fuzzy search
packadd fzf
call minpac#add('junegunn/fzf', {'type': 'opt'})
packadd fzf.vim
call minpac#add('junegunn/fzf.vim', {'type': 'opt'})
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF configuration 
au FileType fzf set nonu nornu
let $FZF_DEFAULT_OPTS='--layout=reverse'
let g:fzf_layout = { 'window': 'call g:FloatingFZF()' }

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

  call nvim_buf_set_keymap(buf, 'i', '<esc>', ':close!<cr>', {'nowait': v:true})
  call nvim_buf_set_keymap(buf, 'n', '<esc>', ':close!<cr>', {'nowait': v:true})
  call nvim_open_win(buf, v:true, opts)
endfunction
" }}}
" rooter {{{
packadd vim-rooter
call minpac#add('airblade/vim-rooter', {'type': 'opt'})
"let g:rooter_silent_chdir = 1
"let g:rooter_manual_only = 1
" }}}
" easy align {{{
packadd vim-easy-align
call minpac#add('junegunn/vim-easy-align', {'type': 'opt'})
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easy Align mappings
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
vnoremap <silent> <Enter> :EasyAlign<CR>
" }}}
" projectionist {{{
packadd vim-projectionist
call minpac#add('tpope/vim-projectionist', {'type': 'opt'})
" }}}
" vhdl {{{
packadd simple-vhdl.vim
call minpac#add('dstadelm/simple-vhdl.vim', {'type': 'opt'})
" }}}
" }}}
"    " key mappings {{{
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
:tnoremap <Esc> <C-\><C-N>
" }}}
" vim settings {{{
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
"set relativenumber               " shows relative numbers
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
" }}}
" jump to the last position when reopening a file {{{
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" }}}
