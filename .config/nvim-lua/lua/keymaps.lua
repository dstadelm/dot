local map = require("utils").map
local nmap = require("utils").nmap
local imap = require("utils").imap
local vmap = require("utils").vmap
local tmap = require("utils").tmap
local nnoremap = require("utils").nnoremap
local inoremap = require("utils").inoremap
local vnoremap = require("utils").vnoremap
local tnoremap = require("utils").tnoremap

vim.g.mapleader = ','
vim.g.maplocalleader = ' '

nnoremap("<leader>e", ':e <C-R>=expand("%:p:h") . "/" <CR>', {silent = false})
nnoremap("<leader>s", ':vsplit <C-R>=expand("%:p:h") . "/" <CR>', {silent = false})
nnoremap("<leader>r", ':read <C-R>=expand("%:p:h") . "/" <CR>', {silent = false})
--nnoremap("<leader>P", ':set paste')
--nnoremap("<leader>p", ':set nopaste')
nnoremap("<leader>v", ':edit $MYVIMRC<CR>')
nnoremap("<leader>p", ':edit $XDG_CONFIG_HOME/nvim/lua/plugins.lua<CR>')

nnoremap("<leader>w", ':%s/\\s\\+$//gce \\| w<cr>') -- delete all trailing whitespace in current file
nnoremap("<leader>w", ':args `git grep -lI .` \\| argdo %s/\\s\\+$//gce \\| w<cr>') -- delete all trailing whitespace for each file in repo

nnoremap("<leader>d", ':FocusToggle<CR>:Gdiffsplit<CR>')
nnoremap("<leader>f", ':FocusToggle<CR>')
nnoremap("<leader>z", ':ToggleOnly<CR>')

nnoremap("<leader>b", ":lua require'telescope.builtin'.buffers()<CR>")
nnoremap("<leader>ff", ":lua require'telescope.builtin'.find_files()<CR>")
nnoremap("<leader>fl", ":lua require'telescope.builtin'.current_buffer_fuzzy_find()<CR>")
nnoremap("<leader>fg", ":lua require'telescope.builtin'.live_grep()<CR>")
nnoremap("<leader>fh", ":lua require'telescope.builtin'.help_tags()<CR>")
nnoremap("<leader>fr", ":lua require'telescope.builtin'.lsp_references()<CR>")
nnoremap("<leader>fc", ":lua require'config.telescope_config'.find_nvim_config()<CR>")

-- VHDL related mappings
nnoremap("<leader>vi", ":VhdlInsertInstanceFromTag<CR>")
nnoremap("<leader>vc", ":VhdlUpdateCtags<CR>")
nnoremap("<leader>vp", ":VhdlPasteSignals<CR>")
nnoremap("<leader>vs", ":VhdlUpdateSensitivityList<CR>")
nnoremap("<leader>vb", ":VhdlBeautify<CR>")

nnoremap("<leader>+", ':exe "resize " . (winheight(0) * 6/5)<CR>')
nnoremap("<leader>-", ':exe "resize " . (winheight(0) * 4/5)<CR>')
-- only use this if you are using vim mode in the terminal otherwise you will
-- be missing ctrl-w for backstepping a word...
tmap("<C-W>h", "<C-\\><C-N><C-W>h")
tmap("<C-W>l", "<C-\\><C-N><C-W>l")
tmap("<C-W>j", "<C-\\><C-N><C-W>j")
tmap("<C-W>k", "<C-\\><C-N><C-W>k")


-- Keep cursor at the position it is when concatenating lines
-- nnoremap("J", "mzJ'z")

-- Jump to next, but leave the cursor line at the position it is
-- Additionally open the fold if there is one
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")

-- Insert undo  break points
-- Interferance with .. and ,, for vhdl?
-- imap(",", ",<C-g>u")
-- imap(".", ".<C-g>u")
-- imap("[", "[<C-g>u")
-- imap("(", "(<C-g>u")
-- imap("{", "{<C-g>u")

-- add mapping to be able to move around lines
inoremap("<C-k>", "<esc>:m .-2<CR>==i")
inoremap("<C-j>", "<esc>:m .+1<CR>==i")
nnoremap("<leader>j", ":m .+1<CR>==")
nnoremap("<leader>k", ":m .-2<CR>==")

-- move around visually selected lines
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

vim.cmd("cabbrev Q q")
vim.cmd("cabbrev W w")
vim.cmd("cabbrev Wq wq")

-- make diff[get/put] shorter and repeatable
-- require('paq'){
--   {'tpope/vim-repeat', {opt = true} },
--   {'kreskij/Repeatable.vim', {opt = true} },
-- }
--vim.cmd("Repeatable nnoremap <leader>dg :diffget<CR>")
--vim.cmd("Repeatable nnoremap <leader>dp :diffput<CR>")

tnoremap(",,", "<C-\\><C-N>", {silent = false})
nnoremap("<F1>", ":FloatermToggle<CR>")
tnoremap("<F1>", "<C-\\><C-N>:FloatermToggle<CR>")
vim.cmd[[
if has('balloon_eval')
    nnoremap <F12>           : setl beval!<CR>
    set bexpr=InspectSynHL()
endif
fun! InspectSynHL()
    let l:synNames = []
    let l:idx = 0
    for id in synstack(v:beval_lnum, v:beval_col)
        call add(l:synNames, printf('%s%s', repeat(' ', idx), synIDattr(id, 'name')))
        let l:idx+=1
    endfor
    return join(l:synNames, "\n")
endfun
]]
