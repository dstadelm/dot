return {
	{
		"tpope/vim-vinegar",
		enabled = require("config").is_enabled("vinegar"),
		lazy = true,
		event = "VeryLazy",
	}, -- changes netrw behaviour press I to see default netrw, gh for toggling hideing
}
