return {
	{
		"ThePrimeagen/git-worktree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		enabled = require("config").is_enabled("git_worktree"),
		config = true,
	},
}
