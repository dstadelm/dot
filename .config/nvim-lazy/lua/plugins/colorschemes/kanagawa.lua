local config = require("config")
return {
	"rebelot/kanagawa.nvim",
	enabled = config.is_enabled("kanagawa"),
	priority = config.get_colorscheme_priority("kanagawa"),
	lazy = config.get_colorscheme_lazy("kanagawa"),
	event = "VeryLazy",
	-- opts = {
	-- 	undercurl = true, -- enable undercurls
	-- 	commentStyle = { italic = true },
	-- 	functionStyle = {},
	-- 	keywordStyle = { italic = true },
	-- 	statementStyle = { bold = true },
	-- 	typeStyle = {},
	-- 	variablebuiltinStyle = { italic = true },
	-- 	specialReturn = true, -- special highlight for the return keyword
	-- 	specialException = true, -- special highlight for exception handling keywords
	-- 	transparent = true, -- do not set background color
	-- 	dimInactive = false, -- dim inactive window `:h hl-NormalNC`
	-- 	globalStatus = false, -- adjust window separators highlight for laststatus=3
	-- 	terminalColors = true, -- define vim.g.terminal_color_{0,17}
	-- 	colors = {},
	-- 	overrides = {},
	-- 	theme = "default", -- Load "default" theme or the experimental "light" theme
	-- },
	config = true,
}
