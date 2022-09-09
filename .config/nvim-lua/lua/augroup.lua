local nnoremap = require("utils").nnoremap
vim.cmd([[
let blacklist = ['gitcommit']
augroup MyAugroup
  autocmd!
  autocmd BufWritePre * silent! %s/\s\+$//e
  autocmd BufWritePost *.vim :source %
  autocmd BufWritePost *.lua :source %
  autocmd FileType tex setl suffixesadd+=tex
  autocmd FileType sh let g:is_bash=1
  " jump to the last position when reopening a file
  autocmd BufReadPost * if index(blacklist, &ft) < 0 && line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=400}
augroup END

augroup MyCommentary
  autocmd!
  autocmd FileType vhdl setlocal commentstring=--\ %s
augroup END

]])

--------------------------------------------------------------------------------
-- Create a mapping by a autocmd for executing the current python file
local auto_source_group = vim.api.nvim_create_augroup("AutoSourceGroup", {clear = true})
local python_run_keymap = function()
  nnoremap("<leader>x", ":sp | term python3 %<CR> :startinsert<CR>")
end
vim.api.nvim_create_autocmd("FileType", {pattern="python", group = auto_source_group, callback = python_run_keymap})

--------------------------------------------------------------------------------
-- Modify the suffixesadd an the path when in .config directory to be able to
-- jump directly to config files from plugin.lua
local set_config_path_group = vim.api.nvim_create_augroup("ConfigPathGroup", {clear = true})
local set_config_path = function()
  vim.bo.suffixesadd = ".lua"
end
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {pattern=vim.env.XDG_CONFIG_HOME .. '/**', group = set_config_path_group, callback = set_config_path, once = true})

--------------------------------------------------------------------------------
-- Disable line numbers in terminal mode
local neovim_terminal_group = vim.api.nvim_create_augroup("NeovimTerminalGroup", {clear = true})
vim.api.nvim_create_autocmd("TermOpen", {pattern="*", group = neovim_terminal_group, command="setlocal nonumber norelativenumber"})

--------------------------------------------------------------------------------
-- Create a winbar which change the bg color according to the mode
--
-- local set_winbar_color_group = vim.api.nvim_create_augroup("SetWinbarColorGroup", {clear = true})
-- local set_winbar_color = function()
--   vim.o.winbar = "%{%v:lua.require'usr.winbar'.eval()%}"
--   vim.o.laststatus = 3
-- end

-- vim.api.nvim_create_autocmd({"ModeChanged"}, {pattern='*', group = set_winbar_color_group, callback = set_winbar_color})

--------------------------------------------------------------------------------
-- Set the cursor line to the middle of the screen
-- local cursor_line_group = vim.api.nvim_create_augroup("CursorLine", {clear = true})
-- vim.api.nvim_create_autocmd({"BufEnter", "WinEnter", "VimResized", "WinNew"}, {pattern="*,*.*", group = cursor_line_group, command="let &scrolloff=winheight(win_getid())/2"})

