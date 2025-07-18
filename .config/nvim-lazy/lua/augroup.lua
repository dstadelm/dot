vim.cmd([[
let blacklist = ['gitcommit']
augroup MyAugroup
  autocmd!
  " autocmd BufWritePre * silent! %s/\s\+$//e
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

local set_cursor_column = function()
	-- vim.notify("BufEnter")
	-- vim.wo.cursorcolumn = true
	local buf = vim.api.nvim_get_current_buf()
	-- vim.notify("BufEnter " .. tostring(buf))
	vim.opt_local.colorcolumn = "120"
	-- vim.cmd("redraw")
end
local unset_cursor_column = function()
	-- vim.notify("BufLeave")
	-- vim.wo.cursorcolumn = false
	-- vim.wo.colorcolumn = 0
	local buf = vim.api.nvim_get_current_buf()
	-- vim.notify("BufLeave " .. tostring(buf))
	vim.opt_local.colorcolumn = "0"
	-- vim.api.nvim_buf_set_option(buf, "colorcolumn", "0")
	-- vim.cmd("redraw")
end
local cursor_column_group = vim.api.nvim_create_augroup("CursorColumn", { clear = true })
vim.api.nvim_create_autocmd(
	{ "BufEnter" },
	{ pattern = "*.py", group = cursor_column_group, callback = set_cursor_column }
)
vim.api.nvim_create_autocmd(
	{ "BufLeave" },
	{ pattern = "*.py", group = cursor_column_group, callback = unset_cursor_column }
)

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

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("dave-lsp-attach", { clear = true }),
	callback = function(event)
		-- NOTE: Remember that Lua is a real programming language, and as such it is possible
		-- to define small helper and utility functions so you don't have to repeat yourself.
		--
		-- In this case, we create a function that lets us more easily define mappings specific
		-- for LSP related items. It sets the mode, buffer and description for us each time.
		local nmap = function(keys, func, desc)
			if desc then
				desc = "LSP: " .. desc
			end
			vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
		end

		-- Mappings.
		-- See `:help vim.diagnostic.*` for documentation on any of the below functions
		nmap("<space>e", vim.diagnostic.open_float, "Open diacnostic float")
		nmap("[d", vim.diagnostic.goto_prev, "Diagnostic go to previous")
		nmap("]d", vim.diagnostic.goto_next, "Diagnostic go to next")
		nmap("<space>q", vim.diagnostic.setqflist, "Diagnostic set [q]uickfix list")
		nmap("<leader>gf", vim.diagnostic.setloclist, "Diagnostic set location list")

		nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
		nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
		nmap("K", vim.lsp.buf.hover, "Hover Documentation")
		nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
		nmap("<space>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
		nmap("<space>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
		nmap("<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, "[W]orkspace [L]ist Folders")
		nmap("<space>D", vim.lsp.buf.type_definition, "Type [Definition]")
		nmap("<space>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		nmap("<space>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
		nmap("gr", vim.lsp.buf.references, "[G]oto [R]eferences")

		-- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
		---@param client vim.lsp.Client
		---@param method vim.lsp.protocol.Method
		---@param bufnr? integer some lsp support methods only in specific files
		---@return boolean
		local function client_supports_method(client, method, bufnr)
			if vim.fn.has("nvim-0.11") == 1 then
				return client:supports_method(method, bufnr)
			else
				return client.supports_method(method, { bufnr = bufnr })
			end
		end

		-- The following two autocommands are used to highlight references of the
		-- word under your cursor when your cursor rests there for a little while.
		--    See `:help CursorHold` for information about when this is executed
		--
		-- When you move your cursor, the highlights will be cleared (the second autocommand).
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if
			client
			and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
		then
			local highlight_augroup = vim.api.nvim_create_augroup("dave-lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("dave-lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "dave-lsp-highlight", buffer = event2.buf })
				end,
			})
		end

		-- The following code creates a keymap to toggle inlay hints in your
		-- code, if the language server you are using supports them
		--
		-- This may be unwanted, since they displace some of your code
		if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
			nmap("<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end, "[T]oggle Inlay [H]ints")
		end
	end,
})
