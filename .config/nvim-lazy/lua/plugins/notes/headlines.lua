local is_enabled = require("config").is_enabled
return {
	"lukas-reineke/headlines.nvim",
	enabled = is_enabled("headlines") and is_enabled("treesitter"),
	dependencies = {
		"treesitter",
	},
	lazy = true,
	ft = { "norg", "markdown" },
	opts = {
		norg = {
			headline_highlights = { "Headline1", "Headline2", "Headline3", "Headline4", "Headline5", "Headline6" },
			codeblock_highlight = { "NeorgCodeBlock" },
		},
		markdown = {
			headline_highlights = { "Headline1", "Headline2", "Headline3", "Headline4", "Headline5", "Headline6" },
			codeblock_highlight = { "CodeBlock" },
		},
	},
	-- config = true,
}
