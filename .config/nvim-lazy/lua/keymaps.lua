local map = vim.api.nvim_set_keymap
map("n", "<leader>ef", ':e <C-R>=expand("%:p:h") . "/" <CR>', { desc = "Open file relative to current file" })
map("n", "<leader>rf", ':read <C-R>=expand("%:p:h") . "/" <CR>', { desc = "Read content of file to this file" })
map("n", "<leader>sf", ':vsplit <C-R>=expand("%:p:h") . "/" <CR>', { desc = "Open file relative to current in split" })
map("n", "<leader>fs", ":lua require('utilities.stack_overflow').stack_overflow()<CR>", { desc = "Search stack overflow" })
map("n", "<leader>w", 'ciw<C-R>0<ESC>', { desc = "Delete word and replace with current yank (dot repeatable)" })
map("n", "<leader>z", ':ToggleOnly<CR>', { desc = "Maximize / Restore Window" })

map("n", "<leader>dap", '"_dap', { desc = "Delete around paragraph to black hole register" })
map("n", "<leader>das", '"_das', { desc = "Delete around sentece to black hole register" })
map("n", "<leader>daw", '"_daw', { desc = "Delete around word to black hole register" })
map("n", "<leader>dip", '"_dip', { desc = "Delete in paragraph to black hole register" })
map("n", "<leader>dis", '"_dis', { desc = "Delete in sentence to black hole register" })
map("n", "<leader>diw", '"_diw', { desc = "Delete in word to black hole register" })
map("n", "<leader>df", '"_df', { desc = "Delete to {char}" })
map("n", "<leader>dt", '"_dt', { desc = "Delete till {char}" })
map("n", "<leader>ds", ':%s/\\s\\+$//gce \\| w<cr>', { desc = "Delete all trailing whitespace in current file" })
map("n", "<leader>dw", '"_dw', { desc = "Delete word to black hole register" })
map("n", "<leader>cap", '"_cap', { desc = "Change around paragraph to black hole register" })
map("n", "<leader>cas", '"_cas', { desc = "Change around sentece to black hole register" })
map("n", "<leader>caw", '"_caw', { desc = "Change around word to black hole register" })
map("n", "<leader>cd", ':cd %:p:h<CR>', { desc = "Change directory to directory of current file" })
map("n", "<leader>cip", '"_cip', { desc = "Change in paragraph to black hole register" })
map("n", "<leader>cis", '"_cis', { desc = "Change in sentence to black hole register" })
map("n", "<leader>ciw", '"_ciw', { desc = "Change in word to black hole register" })
map("n", "<leader>cf", '"_cf', { desc = "Change to {char}" })
map("n", "<leader>ct", '"_ct', { desc = "Change till {char}" })
map("n", "<leader>cw", '"_cw', { desc = "Change word to black hole register" })
--------------------------------------------------------------------------------
-- Initial idea from here http://www.kevinli.co/posts/2017-01-19-multiple-cursors-in-500-bytes-of-vimscript/
-- Mappings from here https://github.com/olimorris/dotfiles/blob/main/.config/nvim/lua/Oli/core/mappings.lua
-- Discussion on the mappings https://github.com/akinsho/dotfiles/issues/9
-- Word Mode
-- ==========
-- 1. Position in the cursor anywhere in the word you wish to change;
-- 2. Or, visually make a selection;
-- 3. Hit <leader>cn, type the new word, then go back to Normal mode;
-- 4. Hit `.` n-1 times, where n is the number of replacements.
--
-- Macro Mode
-- ==========
-- 1. Position the cursor over a word; alternatively, make a selection.
-- 2. Hit <leader>cq to start recording the macro.
-- 3. Once you are done with the macro, go back to normal mode.
-- 4. Hit Enter to repeat the macro over search matches.
--
local mc = vim.api.nvim_replace_termcodes([[y/\V<C-r>=escape(@", '/')<CR><CR>]], true, true, true)
map("n", "<leader>cn", "*``cgn", { desc = "Multicurser change next occurance"} )
map("n", "<leader>cN", "*``cgN", { desc = "Multicurser change previous occurance"} )
map("n", "<leader>cq", ":<C-u>lua require('functions.multicursor').setup()<CR>*``qz", { desc = "Multicurser change using macro"} )

map("x", "<leader>cn", mc .. "``cgn", { desc = "Multicurser change next occurance"} )
map("x", "<leader>cN", mc .. "``cgN", { desc = "Multicurser change previous occurance"} )
map("x", "<leader>cq", ":<C-u>lua require('functions.multicursor').setup()<CR>gv" .. mc .. "``qz", { desc = "Multicurser change using macro"} )
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Move lines
map("i", "<A-k>", '<esc>:m .-2<CR>==i', { desc = "Move current line one up" })
map("i", "<A-j>", '<esc>:m .+1<CR>==i', { desc = "Move current line one down" })
map("n", "<A-k>", ':m .-2<CR>==', { desc = "Move current line one up" })
map("n", "<A-j>", ':m .+1<CR>==', { desc = "Move current line one down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move current line one up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move current line one down" })

map("v", ".", ":norm .<CR>", { desc = "Execute last operation on visual selection" })

map("n", "<F10>", ":ToggleTerm direction=float<CR>", { desc = "Toggle Terminal" })
map("t", "<F10>", "<C-\\><C-N>:ToggleTerm<CR>", { desc = "Toggle Terminal" })

map("n", "n", "nzzzv", { desc = "Go to next search occurance and center" })
map("n", "N", "Nzzzv", { desc = "Go to previous search occurance and center" })

map("n", "<C-w>>", "<C-w>10>", { desc = "Increase current window width"})
map("n", "<C-w><", "<C-w>10<", { desc = "Decrease current window width"})

map("n", "g,", "g,zvzz", { desc = "Go to newer position in the change list"})
map("n", "g;", "g;zvzz", { desc = "Go to older position in the change list"})

map("v", ">", ">gv", { desc = "Indent to right and reselect"})
map("v", "<", "<gv", { desc = "Indent to left and reselect"})

--------------------------------------------------------------------------------
-- window mappings
--
map("n", "<C-W>>", ':exe "vert resize " . (winwidth(0) * 6/5)<CR>', { desc = "Increase vertical widnow size by 6/5"})
map("n", "<C-W><", ':exe "vert resize " . (winwidth(0) * 4/5)<CR>', { desc =  "Decrease vertical window size by 4/5"})
map("n", "<C-W>+", ':exe "resize " . (winheight(0) * 6/5)<CR>', { desc =  "Increase horizontal window size by 6/5"})
map("n", "<C-W>-", ':exe "resize " . (winheight(0) * 4/5)<CR>', { desc =  "Decrease horizontal window size by 4/5"})


--------------------------------------------------------------------------------
-- Terminal mode mappings
-- ----------------------
--
-- only use this if you are using vim mode in the terminal otherwise you will
-- be missing ctrl-w for backstepping a word...
local function termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
map("t", "<C-W>h", termcodes("<C-\\><C-n><C-W>h"), { desc = "Move left"})
map("t", "<C-W>j", termcodes("<C-\\><C-n><C-W>j"), { desc = "Move down"})
map("t", "<C-W>k", termcodes("<C-\\><C-n><C-W>k"), { desc = "Move up"})
map("t", "<C-W>l", termcodes("<C-\\><C-n><C-W>l"), { desc = "Move right "})
map("t",  ",," , termcodes("<C-\\><C-n>"), { desc = "Normal mode"})
