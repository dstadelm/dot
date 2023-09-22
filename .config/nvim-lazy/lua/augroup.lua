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
local term_output_buffer = nil
local auto_source_group = vim.api.nvim_create_augroup("AutoSourceGroup", { clear = true })
local runner = function(prg)
	return function()
		if term_output_buffer then
			if vim.api.nvim_buf_is_valid(term_output_buffer) then
				vim.notify("Termbuf exists")
				vim.api.nvim_buf_delete(term_output_buffer, { force = true })
			end
		else
			vim.notify("Termbuf does not exist")
		end
		vim.cmd("sp")
		local term = "term " .. prg .. " %"
		vim.cmd(term)
		-- vim.cmd("startinsert")
		term_output_buffer = vim.api.nvim_get_current_buf()
	end
end
local runner_keymap = function(prg)
	return function()
		vim.api.nvim_set_keymap("n", "<leader>x", "", { desc = "execute current file", callback = runner(prg) })
	end
end
vim.api.nvim_create_autocmd(
	"FileType",
	{ pattern = "python", group = auto_source_group, callback = runner_keymap("python3") }
)
vim.api.nvim_create_autocmd("FileType", { pattern = "sh", group = auto_source_group, callback = runner_keymap("bash") })

-- -- moved this code to null_ls config
-- local auto_format_group = vim.api.nvim_create_augroup("AutoFormatGroup", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePre",
--   { pattern = "*.py",
--     group = auto_format_group,
--     command = "lua vim.lsp.buf.format{ filter = function(client) return client.name ~= 'pylsp' end }"
--   }
-- )

--------------------------------------------------------------------------------
-- Modify the suffixesadd an the path when in .config directory to be able to
-- jump directly to config files from plugin.lua
local set_config_path_group = vim.api.nvim_create_augroup("ConfigPathGroup", { clear = true })
local set_config_path = function()
	vim.bo.suffixesadd = ".lua"
end
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = vim.env.XDG_CONFIG_HOME .. "/**",
	group = set_config_path_group,
	callback = set_config_path,
	once = true,
})

--------------------------------------------------------------------------------
-- Disable line numbers in terminal mode
local neovim_terminal_group = vim.api.nvim_create_augroup("NeovimTerminalGroup", { clear = true })
vim.api.nvim_create_autocmd(
	"TermOpen",
	{ pattern = "*", group = neovim_terminal_group, command = "setlocal nonumber norelativenumber" }
)

--------------------------------------------------------------------------------
-- Disable relative numbers in command mode
-- local command_group = vim.api.nvim_create_augroup("CommandGroup", { clear = true })
--
-- vim.api.nvim_create_autocmd("CmdlineEnter", { group = command_group, command = "set norelativenumber" })
-- vim.api.nvim_create_autocmd("CmdlineLeave", { group = command_group, command = "set relativenumber" })
-- vim.api.nvim_create_autocmd("CmdlineEnter", { group = command_group, command = "set hls" })
-- vim.api.nvim_create_autocmd("CmdlineLeave", { group = command_group, command = "set nohls" })
--------------------------------------------------------------------------------
-- Create a winbar which changes the bg color according to the mode
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
