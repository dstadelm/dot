local M = {}
M.center_cursorline = false
M.default_scrolloff = vim.o.scrolloff
local function centered()
	vim.o.scrolloff = math.floor((vim.api.nvim_win_get_height(vim.api.nvim_get_current_win()) + 1) / 2)
end
function M.toggle_center_cursorline()
	M.center_cursorline = not M.center_cursorline
	local cursor_line_group = vim.api.nvim_create_augroup("CursorLine", { clear = true })
	if M.center_cursorline == true then
		vim.api.nvim_create_autocmd(
			{ "BufEnter", "WinEnter", "VimResized", "WinNew" },
			{ pattern = "*,*.*", group = cursor_line_group, callback = centered }
		)
		centered()
	else
		vim.o.scrolloff = M.default_scrolloff
	end
end
vim.api.nvim_create_user_command("ToggleCenterCursorline", M.toggle_center_cursorline, {})
return M
