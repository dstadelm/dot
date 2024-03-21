local M = {}

function M.stack_overflow()
	local open_term = require("functions.open_term").open_term
	local buf = vim.api.nvim_get_current_buf()
	local file_type = vim.api.nvim_buf_get_option(buf, "filetype")
	vim.ui.input({ prompt = "so input: ", default = file_type .. " " }, function(input)
		local cmd = ""
		if input == "" or not input then
			return
		elseif input == "h" then
			cmd = "-h"
		else
			cmd = input
		end
		cmd = "so " .. cmd
		open_term(cmd, { direction = "float" })
	end)
end

return M
