local map = vim.api.nvim_set_keymap

local toggle_term_horz = function()
	vim.cmd([[ToggleTerm direction=horizontal size=20]])
	vim.cmd([[startinsert]])
end

local toggle_term_vert = function()
	vim.cmd([[ToggleTerm direction=vertical size=160]])
	vim.cmd([[startinsert]])
end

local toggle_term_float = function()
	vim.cmd([[ToggleTerm direction=float]])
	vim.cmd([[startinsert]])
end

local toggle_term = function()
	vim.cmd([[ToggleTerm]])
	vim.cmd([[startinsert]])
end

map(
	"n",
	"<leader>e",
	':e <C-R>=expand("%:p:h") . "/" <CR>',
	{ noremap = true, silent = false, desc = "Open file relative to current file" }
)
map(
	"n",
	"<leader>rf",
	':read <C-R>=expand("%:p:h") . "/" <CR>',
	{ noremap = true, silent = true, desc = "Read content of file to this file" }
)
map(
	"n",
	"<leader>sf",
	':vsplit <C-R>=expand("%:p:h") . "/" <CR>',
	{ noremap = true, silent = false, desc = "Open file relative to current in split" }
)
map(
	"n",
	"<leader>fs",
	":lua require('utilities.stack_overflow').stack_overflow()<CR>",
	{ noremap = true, silent = true, desc = "Search stack overflow" }
)
-- map(
-- 	"n",
-- 	"<leader>w",
-- 	"ciw<C-R>0<ESC>",
-- 	{ noremap = true, silent = true, desc = "Delete word and replace with current yank (dot repeatable)" }
-- )
map("n", "<leader>z", ":ToggleOnly<CR>", { noremap = true, silent = true, desc = "Maximize / Restore Window" })
map(
	"n",
	"<leader>cd",
	":cd %:p:h<CR>",
	{ noremap = true, silent = true, desc = "Change directory to directory of current file" }
)
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
map("n", "<leader>cn", "*``cgn", { noremap = true, silent = true, desc = "Multicurser change next occurance" })
map("n", "<leader>cN", "*``cgN", { noremap = true, silent = true, desc = "Multicurser change previous occurance" })
map(
	"n",
	"<leader>cq",
	":<C-u>lua require('functions.multicursor').setup()<CR>*``qz",
	{ noremap = true, silent = true, desc = "Multicurser change using macro" }
)

map("x", "<leader>cn", mc .. "``cgn", { noremap = true, silent = true, desc = "Multicurser change next occurance" })
map("x", "<leader>cN", mc .. "``cgN", { noremap = true, silent = true, desc = "Multicurser change previous occurance" })
map(
	"x",
	"<leader>cq",
	":<C-u>lua require('functions.multicursor').setup()<CR>gv" .. mc .. "``qz",
	{ noremap = true, silent = true, desc = "Multicurser change using macro" }
)
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Move lines
-- map("i", "<A-k>", "<esc>:m .-2<CR>==i", { noremap = true, silent = true, desc = "Move current line one up" })
-- map("i", "<A-j>", "<esc>:m .+1<CR>==i", { noremap = true, silent = true, desc = "Move current line one down" })
-- map("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true, desc = "Move current line one up" })
-- map("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true, desc = "Move current line one down" })
-- map("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move current line one up" })
-- map("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move current line one down" })

map("v", ".", ":norm .<CR>", { noremap = true, silent = true, desc = "Execute last operation on visual selection" })

map("t", "<leader>tt", "<C-\\><C-N>:ToggleTerm<CR>", { noremap = true, silent = true, desc = "[T]oggle [T]erminal" })
map("n", "<leader>tt", "", { callback = toggle_term, noremap = true, silent = true, desc = "[T]oggle [T]erminal" })
map(
	"n",
	"<leader>tf",
	"",
	{ callback = toggle_term_float, noremap = true, silent = true, desc = "[T]oggle terminal [F]loat" }
)
map(
	"n",
	"<leader>th",
	"",
	{ callback = toggle_term_horz, noremap = true, silent = true, desc = "[T]oggle terminal [H]orizontal" }
)
map(
	"n",
	"<leader>tv",
	"",
	{ callback = toggle_term_vert, noremap = true, silent = true, desc = "[T]oggle terminal [V]ertical" }
)

map("n", "n", "nzzzv", { noremap = true, silent = true, desc = "Go to next search occurance and center" })
map("n", "N", "Nzzzv", { noremap = true, silent = true, desc = "Go to previous search occurance and center" })

-- map("n", "<C-w>>", "<C-w>10>", { noremap = true, silent = true, desc = "Increase current window width" })
-- map("n", "<C-w><", "<C-w>10<", { noremap = true, silent = true, desc = "Decrease current window width" })

map("n", "g,", "g,zvzz", { noremap = true, silent = true, desc = "Go to newer position in the change list" })
map("n", "g;", "g;zvzz", { noremap = true, silent = true, desc = "Go to older position in the change list" })

map("v", ">", ">gv", { noremap = true, silent = true, desc = "Indent to right and reselect" })
map("v", "<", "<gv", { noremap = true, silent = true, desc = "Indent to left and reselect" })

--------------------------------------------------------------------------------
-- window mappings
--
local change_window_width = function(fraction)
	return function()
		local window = vim.api.nvim_get_current_win()
		local win_width = vim.api.nvim_win_get_width(window)
		local new_width = math.floor(win_width * fraction)
		vim.api.nvim_win_set_width(window, new_width)
	end
end
map("n", "<C-W>>", "", {
	callback = change_window_width(6 / 5),
	noremap = true,
	silent = true,
	desc = "Increase vertical widnow size by 6/5",
})
map("n", "<C-W><", "", {
	callback = change_window_width(4 / 5),
	noremap = true,
	silent = true,
	desc = "Decrease vertical window size by 4/5",
})
local change_window_height = function(fraction)
	return function()
		local window = vim.api.nvim_get_current_win()
		local win_height = vim.api.nvim_win_get_height(window)
		local new_height = math.floor(win_height * fraction)
		vim.api.nvim_win_set_height(window, new_height)
	end
end
map("n", "<C-W>+", "", {
	callback = change_window_height(6 / 5),
	noremap = true,
	silent = true,
	desc = "Increase horizontal window size by 6/5",
})
map("n", "<C-W>-", "", {
	callback = change_window_height(4 / 5),
	noremap = true,
	silent = true,
	desc = "Decrease horizontal window size by 4/5",
})
for i = 1, 9 do
	map(
		"n",
		"<leader>" .. i,
		":" .. i .. "wincmd w <CR>",
		{ noremap = true, silent = true, desc = "Jump to window " .. i }
	)
end
--------------------------------------------------------------------------------
-- Terminal mode mappings
-- ----------------------
--
-- only use this if you are using vim mode in the terminal otherwise you will
-- be missing ctrl-w for backstepping a word...
local function termcodes(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end
map("t", "<C-W>h", termcodes("<C-\\><C-n><C-W>h"), { noremap = true, silent = true, desc = "Move left" })
map("t", "<C-W>j", termcodes("<C-\\><C-n><C-W>j"), { noremap = true, silent = true, desc = "Move down" })
map("t", "<C-W>k", termcodes("<C-\\><C-n><C-W>k"), { noremap = true, silent = true, desc = "Move up" })
map("t", "<C-W>l", termcodes("<C-\\><C-n><C-W>l"), { noremap = true, silent = true, desc = "Move right " })
map("t", ",,", termcodes("<C-\\><C-n>"), { noremap = true, silent = true, desc = "Normal mode" })
