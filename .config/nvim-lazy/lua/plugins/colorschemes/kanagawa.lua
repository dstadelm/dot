local config = require("config")
return {
	"rebelot/kanagawa.nvim",
	enabled = config.is_enabled("kanagawa"),
	priority = config.get_colorscheme_priority("kanagawa"),
	lazy = config.get_colorscheme_lazy("kanagawa"),
	event = "VeryLazy",
	opts = {
		compile = false, -- enable compiling the colorscheme
		undercurl = true, -- enable undercurls
		commentStyle = { italic = true },
		functionStyle = {},
		keywordStyle = { italic = true },
		statementStyle = { bold = true },
		typeStyle = {},
		transparent = false, -- do not set background color
		dimInactive = false, -- dim inactive window `:h hl-NormalNC`
		terminalColors = true, -- define vim.g.terminal_color_{0,17}
		colors = {
			theme = {
				all = {
					ui = {
						bg_gutter = "none",
					},
				},
			},
		},
	},
	config = function(_, opts)
		require("kanagawa").setup(opts)
		if config.is_default_colorscheme("kanagawa") then
			vim.cmd.colorscheme("kanagawa")
		end
	end,
}
