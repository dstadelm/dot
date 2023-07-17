return {
	"iamcco/markdown-preview.nvim",
	enabled = require("config").is_enabled("markdown_preview"),
	build = "cd app && yarn install",
	cmd = "MarkdownPreview",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
		vim.g.mkdp_theme = "light"
	end,
	ft = { "markdown" },
}
