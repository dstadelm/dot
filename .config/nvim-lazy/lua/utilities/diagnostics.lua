local M = {}

local function toggle_diagnostics()
	local bufnr = vim.api.nvim_get_current_buf()
	if vim.diagnostic.is_disabled() then
		vim.diagnostic.enable(bufnr)
	else
		vim.diagnostic.disable(bufnr)
	end
end

local function define_signs()
	local mysigns = {
		[vim.diagnostic.severity.ERROR] = " ",
		[vim.diagnostic.severity.WARN] = " ",
		[vim.diagnostic.severity.HINT] = " ",
		[vim.diagnostic.severity.INFO] = " ",
	}
	vim.diagnostic.config({ signs = { text = mysigns } })
end

local function create_autocmd()
	local augroup = vim.api.nvim_create_augroup("Diagnotics", { clear = true })
	vim.api.nvim_clear_autocmds({ group = augroup })
	vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
		group = augroup,
		callback = function()
			require("lint").try_lint()
		end,
	})
end

define_signs()
vim.keymap.set("n", "<leader>D", toggle_diagnostics, { desc = "Toggle [D]iagnostics" })
create_autocmd()

return M
