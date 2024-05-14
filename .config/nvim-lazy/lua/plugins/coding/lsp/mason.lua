return {
	"williamboman/mason.nvim",
	name = "mason",
	enabled = require("config").is_enabled("mason"),
	lazy = true,
	cmd = "Mason",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-tool-installer").setup({
			ensure_installed = {
				"stylua",
				"isort",
				"black",
				"yamlfmt",
        "gitlint",
        "shellcheck",
        "marksman",
        "lua-language-server",
        "stylua",
        "lemmix",
        "ruff_lsp",
			},
		})
	end,
}
