let mapleader = ","
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
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :Files<CR>
"inoremap <F1> <Nop>
"inoremap <F2> <Nop>
"inoremap <F3> <Nop>
"inoremap <F4> <Nop>
"inoremap <F5> <Nop>
"inoremap <F6> <Nop>
"inoremap <F7> <Nop>
"inoremap <F8> <Nop>
"inoremap <F9> <Nop>
"inoremap <F10> <Nop>
"inoremap <F11> <Nop>
"inoremap <F12> <Nop>
