return {
	{
		"nvim-neorg/neorg",
		enabled = require("config").is_enabled("neorg"),
		lazy = false,
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
		        {
				"vhyrro/luarocks.nvim",
				priority = 1000,
				config = true,
			},
			opts = {},
		},
		opts = {
			load = {
				["core.defaults"] = {},
				["core.clipboard.code-blocks"] = {},
				["core.ui"] = {},
				["core.itero"] = {},
				["core.summary"] = {},
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
				-- ["core.ui.calendar"] = {},
				["core.pivot"] = {},
				["core.tangle"] = {},
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
