return {
	"j-hui/fidget.nvim", -- progress animation of lsp server
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	lazy = true,
	event = { "LspAttach" },
	enabled = require("config").is_enabled("fidget"),
	config = true,
}
