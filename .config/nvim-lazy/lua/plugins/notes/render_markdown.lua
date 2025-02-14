local is_enabled = require("config").is_enabled
return {
	"MeanderingProgrammer/render-markdown.nvim",
	enabled = is_enabled("render_markdown") and is_enabled("treesitter"),
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
	lazy = true,
	ft = { "markdown", "vimwiki", "neorg" },
	opts = {},
}
