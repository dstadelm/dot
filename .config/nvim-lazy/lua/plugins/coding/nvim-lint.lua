return {
	{
		"mfussenegger/nvim-lint",
		enabled = require("config").is_enabled("nvim_lint"),
		config = function(_, _)
			local lint = require("lint")
			lint.linters_by_ft = {
				sh = { "shellcheck" },
				tex = { "chktex" },
				gitcommit = { "gitlint" },
				rst = { "rstcheck" },
			}
		end,
	},
}
