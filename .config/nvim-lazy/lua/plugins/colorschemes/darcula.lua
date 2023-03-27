local config = require("config")
return {
	{
		"briones-gabriel/darcula-solid.nvim",
		enabled = config.is_enabled("darcula"),
		dependencies = { "rktjmp/lush.nvim" },
		priority = config.get_colorscheme_priority("darcula"),
		lazy = config.get_colorscheme_lazy("darcula"),
		event = "VeryLazy",
	},
}
