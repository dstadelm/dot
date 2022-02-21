call minpac#add('tpope/vim-repeat', {'type': 'opt'})
call minpac#add('kreskij/Repeatable.vim', {'type': 'opt'})
packadd Repeatable.vim
packadd vim-repeat
call repeatable#Setup()
" opening files relative to the current file
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" opening files in vertical split relative to current file
nnoremap <leader>s :vsplit <C-R>=expand("%:p:h") . "/" <CR>
" remap <C-]> as it does not work in putty and wsl terminal
nnoremap ü <C-]>
nnoremap <leader>P :set paste <cr>
nnoremap <leader>p :set nopaste <cr>
nnoremap <leader>v :edit $MYVIMRC <cr>
" delete all trailing whitespace in current file
map <leader>w :%s/\s\+$//gce \| w<cr>
" delete all trailing whitespace for each file in repo
map <leader>W :args `git grep -lI .` \| argdo %s/\s\+$//gce \| w<cr>
" make mappings using abbreviation for accidental capital quit/write-quit
" the reason is that : has to be entered with shift
cabbrev Q q
cabbrev W w
cabbrev Wq wq
" fuzzy finding
" nnoremap <leader>b :lua require'telescope.builtin'.buffers()<CR>
nnoremap <leader>b :lua require'telescope.builtin'.buffers()<CR>
nnoremap <leader>f :lua require'telescope.builtin'.find_files()<CR>
nnoremap <leader>l :lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>

" only use this if you are using vim mode in the terminal otherwise you will
" be missing ctrl-w for backstepping a word...
tnoremap <C-W>h <C-\><C-N><C-W>h
tnoremap <C-W>l <C-\><C-N><C-W>l
tnoremap <C-W>j <C-\><C-N><C-W>j
tnoremap <C-W>k <C-\><C-N><C-W>k

" Make Y behave as expected
nnoremap Y yg_

" Keep cursor at the position it is when concatenating lines
nnoremap J mzJ'z

" Jump to next, but leave the cursor line at the position it is
" Additionally open the fold if there is one
nnoremap n nzzzv
nnoremap N Nzzzv

" Insert undo  break points
" Interferance with .. and ,, for vhdl?
" inoremap , ,<C-g>u
" inoremap . .<C-g>u
" inoremap [ [<C-g>u
" inoremap ( (<C-g>u
" inoremap { {<C-g>u

" add relative movements to the jumplist
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" add mapping to be able to move around lines
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
" move around visually selected lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" make diff[get/put] shorter and repeatable
Repeatable nnoremap <leader>dg :diffget<CR>
Repeatable nnoremap <leader>dp :diffput<CR>
