local null_ls = require("null-ls")
-- register any number of sources simultaneously
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting

local sources = {
code_actions.shellcheck,
diagnostics.shellcheck,
diagnostics.checkmake,
diagnostics.chktex,
diagnostics.gitlint,
formatting.latexindent,
formatting.isort,
formatting.black,
}

null_ls.setup({
	sources = sources,
	on_attach = function(client)
		if client.server_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		end
	end,
})
