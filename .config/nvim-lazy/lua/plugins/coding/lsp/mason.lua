return {
	config = true,
	"williamboman/mason.nvim",
	name = "mason",
	enabled = require("config").is_enabled("mason"),
	lazy = true,
	cmd = "Mason",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
}
