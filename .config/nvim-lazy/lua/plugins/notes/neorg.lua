return {
	{
		"nvim-neorg/neorg",
		enabled = require("config").is_enabled("neorg"),
		lazy = true,
		ft = { "norg" },
		cmd = { "Neorg" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-cmp",
			{
				"folke/zen-mode.nvim",
			},
			opts = {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
				window = {
					backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
					-- height and width can be:
					-- * an absolute number of cells when > 1
					-- * a percentage of the width / height of the editor when <= 1
					-- * a function that returns the width or the height
					width = 0.8, -- width of the Zen window
					height = 0.8, -- height of the Zen window
					-- by default, no options are changed for the Zen window
					-- uncomment any of the options below, or add other vim.wo options you want to apply
					options = {
						signcolumn = "no", -- disable signcolumn
						number = false, -- disable number column
						relativenumber = false, -- disable relative numbers
						cursorline = false, -- disable cursorline
						cursorcolumn = false, -- disable cursor column
						foldcolumn = "0", -- disable fold column
						list = false, -- disable whitespace characters
					},
				},
			},
		},
		build = ":Neorg sync-parsers",
		opts = {
			load = {
				["core.defaults"] = {},
				["core.clipboard.code-blocks"] = {},
				["core.esupport.hop"] = {},
				["core.ui"] = {},
				["core.itero"] = {},
				["core.journal"] = {},
				["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
				["core.integrations.nvim-cmp"] = {},
				["core.dirman"] = {
					config = {
						workspaces = {
							work = "~/notes/work",
							home = "~/notes/home",
							zf = "~/notes/zf",
						},
					},
				},
				["core.dirman.utils"] = {},
				["core.autocommands"] = {},
				["core.integrations.treesitter"] = {},
				["core.concealer"] = { config = { folds = true, icon_preset = "basic" } },
				["core.export"] = {},
				["core.presenter"] = { config = { zen_mode = "zen-mode" } },
				["core.qol.toc"] = { config = { default_split_mode = "split" } },
				["core.qol.todo_items"] = {},
				["core.ui.calendar"] = {},
				["core.pivot"] = {},
				["core.tangle"] = {},
				["core.upgrade"] = {},
			},
		},
		config = function(_, opts)
			local ok, _ = pcall(require, "cmp")
			if ok then
				vim.tbl_extend("keep", opts.load, {
					["core.norg.completion"] = {
						config = {
							engine = "nvim-cmp",
						},
					},
				})
			end
			require("neorg").setup(opts)
		end,
	},
}
