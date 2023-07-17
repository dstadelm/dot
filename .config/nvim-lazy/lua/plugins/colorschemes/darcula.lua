local config = require("config")
return {
	enabled = config.is_enabled("darcula"),
	"briones-gabriel/darcula-solid.nvim",
	dependencies = { "rktjmp/lush.nvim" },
	priority = config.get_colorscheme_priority("darcula"),
	lazy = config.get_colorscheme_lazy("darcula"),
	event = "VeryLazy",
	config = function()
		if config.is_default_colorscheme("darcula") then
			vim.cmd.colorscheme("darcula")
		end
	end,
}
