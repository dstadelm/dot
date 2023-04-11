return {
	{
		"tpope/vim-fugitive",
		enabled = require("config").is_enabled("fugitiv"),
		lazy = true,
		cmd = { "Git", "Gcd" },
	},
}
