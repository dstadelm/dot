local M = {}
M.autoformat = true

local function format(_)
	local bufnr = vim.api.nvim_get_current_buf()
	require("conform").format({
		timeout_ms = 2500,
		bufnr = bufnr,
		lsp_fallback = true,
		filter = function(client)
			if client.supports_method("textDocument/formatting") then
				if client.name ~= "lua_ls" and client.name ~= "pyright" and client.name ~= "pylsp" then
					return true
				end
			end
			return false
		end,
	})
end

local function auto_format()
	if M.autoformat then
		format()
	end
end

local function toggle_autoformat()
	M.autoformat = not M.autoformat
	if M.autoformat then
		vim.notify("Enabled autoformat", vim.log.levels.INFO)
	else
		vim.notify("Disabled autoformat", vim.log.levels.INFO)
	end
end

local function create_user_commands()
	vim.api.nvim_create_user_command("ToggleAutoformat", toggle_autoformat, { desc = "Toggle Autoformat" })
	vim.api.nvim_create_user_command("Format", format, { desc = "Format current buffer with conform fallback to LSP" })
end

local function create_autocmd()
	local augroup = vim.api.nvim_create_augroup("Formatting", { clear = true })
	vim.api.nvim_clear_autocmds({ group = augroup })
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = augroup,
		callback = auto_format,
	})
end

create_autocmd()
create_user_commands()
vim.keymap.set("n", "<leader>F", toggle_autoformat, { desc = "Toggle Auto[F]ormat" })

return M
