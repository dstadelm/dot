return {
	"jose-elias-alvarez/null-ls.nvim",
	enabled = require("config").is_enabled("null_ls"),
	-- lazy = true,
	-- event = "VeryLazy",
	config = function()
		local null_ls = require("null-ls")
		-- register any number of sources simultaneously
		local diagnostics = null_ls.builtins.diagnostics
		local code_actions = null_ls.builtins.code_actions
		local formatting = null_ls.builtins.formatting
		-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		local sources = {
			code_actions.shellcheck,
			diagnostics.shellcheck,
			diagnostics.checkmake,
			diagnostics.chktex,
			diagnostics.gitlint,
			formatting.latexindent,
			formatting.isort,
			formatting.black, -- .with({ extra_args = {"--line-length", "120"}}),
			formatting.stylua,
			formatting.yamlfmt,
		}

		null_ls.setup({
			sources = sources,
		})
	end,
}
