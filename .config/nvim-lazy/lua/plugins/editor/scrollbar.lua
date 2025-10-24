return {
	"petertriho/nvim-scrollbar",
	enabled = require("config").is_enabled("scrollbar"),
	event = "VeryLazy",
	opts = {
		handlers = {
			cursor = true,
			diagnostic = true,
			gitsigns = true,
			handle = true,
			search = false,
			ale = false,
			neotest = false,
		},
		excluded_filetypes = {
			"cmp_menu",
			"cmp_docs",
			"notify",
			"TelescopePrompt",
			"TelescopeResults",
			"Trouble",
		},
	},
	config = function(_, opts)
		require("scrollbar").setup(opts)
	end,
}
