local M = {}

local function toggle_diagnostics()
	local bufnr = vim.api.nvim_get_current_buf()
	if vim.diagnostic.is_enabled() then
		vim.diagnostic.enable(false, { bufnr = bufnr })
		vim.notify("Diagnostics disabled for this buffer", vim.log.levels.INFO, { title = "Diagnostics" })
	else
		vim.diagnostic.enable(true, { bufnr = bufnr })
		vim.notify("Diagnostics enabled for this buffer", vim.log.levels.INFO, { title = "Diagnostics" })
	end
end

local function configure()
	local mysigns = {
		[vim.diagnostic.severity.ERROR] = " ",
		[vim.diagnostic.severity.WARN] = " ",
		[vim.diagnostic.severity.HINT] = " ",
		[vim.diagnostic.severity.INFO] = " ",
	}
	vim.diagnostic.config({
		signs = { text = mysigns },
		underline = false,
		virtual_text = true,
		virtual_lines = false,
		update_in_insert = false,
	})
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

configure()
vim.diagnostic.config({})

vim.keymap.set("n", "<leader>D", toggle_diagnostics, { desc = "Toggle [D]iagnostics" })
create_autocmd()

return M
