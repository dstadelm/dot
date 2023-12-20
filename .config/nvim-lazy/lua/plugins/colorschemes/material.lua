local config = require("config")
return {
	"marko-cerovac/material.nvim",
	enabled = config.is_enabled("material"),
	priority = config.get_colorscheme_priority("material"),
	lazy = config.get_colorscheme_lazy("material"),
	event = "VeryLazy",
	init = function()
		vim.g.material_style = "palenight"
	end,
	config = function(_, _)
		require("material").setup({

			contrast = {
				terminal = false, -- Enable contrast for the built-in terminal
				sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
				floating_windows = true, -- Enable contrast for floating windows
				cursor_line = false, -- Enable darker background for the cursor line
				non_current_windows = false, -- Enable contrasted background for non-current windows
				filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
			},

			styles = { -- Give comments style such as bold, italic, underline etc.
				comments = { italic = true },
				strings = { italic = true },
				keywords = { --[[ underline = true ]]
				},
				functions = { --[[ bold = true, undercurl = true ]]
				},
				variables = {},
				operators = {},
				types = {},
			},

			plugins = { -- Uncomment the plugins that you use to highlight them
				-- Available plugins:
				"dap",
				-- "dashboard",
				-- "eyeliner",
				-- "fidget"
				-- "flash"
				"gitsigns",
				-- "harpoon",
				-- "hop",
				-- "illuminate",
				-- "indent-blankline",
				"lspsaga",
				-- "mini",
				-- "neogit",
				"neotest",
				"neorg",
				"noice",
				-- "nvim-cmp",
				-- "nvim-navic",
				-- "nvim-tree",
				"nvim-web-devicons",
				-- "rainbow-delimiters",
				-- "sneak",
				"telescope",
				"trouble",
				"which-key",
			},

			disable = {
				colored_cursor = false, -- Disable the colored cursor
				borders = false, -- Disable borders between verticaly split windows
				background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
				term_colors = false, -- Prevent the theme from setting terminal colors
				eob_lines = false, -- Hide the end-of-buffer lines
			},

			high_visibility = {
				lighter = false, -- Enable higher contrast text for lighter style
				darker = false, -- Enable higher contrast text for darker style
			},

			lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )

			async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

			custom_colors = nil, -- If you want to override the default colors, set this to a function

			custom_highlights = {
				CurSearch = { bg = "#5b5f40" },
				Search = { bg = "#3b3f40" },
				IncSearch = { bg = "#3b3f40" },
			}, -- Overwrite highlights with your own
		})
		-- require("material").setup({
		-- 	contrast = {
		-- 		terminal = false, -- Enable contrast for the built-in terminal
		-- 		sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
		-- 		floating_windows = false, -- Enable contrast for floating windows
		-- 		cursor_line = false, -- Enable darker background for the cursor line
		-- 		non_current_windows = false, -- Enable darker background for non-current windows
		-- 		filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
		-- 	},
		--
		-- 	style = { -- Give comments style such as bold, italic, underline etc.
		-- 		comments = { [[ italic = true ]] },
		-- 		strings = { [[ italic = true ]] },
		-- 		keywords = { [[ underline = true ]] },
		-- 		functions = { [[ bold = true ]] },
		-- 		variables = {},
		-- 		operators = {},
		-- 		types = {},
		-- 	},
		--
		-- 	plugins = { -- Uncomment the plugins that you use to highlight them
		-- 		-- Available plugins:
		-- 		"dap",
		-- 		-- "dashboard",
		-- 		"gitsigns",
		-- 		-- "hop",
		-- 		"indent-blankline",
		-- 		"lspsaga",
		-- 		-- "mini",
		-- 		-- "neogit",
		-- 		"nvim-cmp",
		-- 		-- "nvim-navic",
		-- 		-- "nvim-tree",
		-- 		"nvim-web-devicons",
		-- 		-- "sneak",
		-- 		"telescope",
		-- 		"trouble",
		-- 		"which-key",
		-- 	},
		--
		-- 	disable = {
		-- 		colored_cursor = false, -- Disable the colored cursor
		-- 		borders = false, -- Disable borders between verticaly split windows
		-- 		background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
		-- 		term_colors = false, -- Prevent the theme from setting terminal colors
		-- 		eob_lines = false, -- Hide the end-of-buffer lines
		-- 	},
		--
		-- 	high_visibility = {
		-- 		lighter = false, -- Enable higher contrast text for lighter style
		-- 		darker = false, -- Enable higher contrast text for darker style
		-- 	},
		--
		-- 	lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )
		--
		-- 	async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
		--
		-- 	custom_colors = nil, -- If you want to everride the default colors, set this to a function
		--
		-- 	custom_highlights = {
		-- 		CurSearch = { bg = "#5b5f40" },
		-- 		Search = { bg = "#3b3f40" },
		-- 		IncSearch = { bg = "#3b3f40" },
		-- 	}, -- Overwrite highlights with your own
		-- })
		if config.is_default_colorscheme("material") then
			vim.cmd.colorscheme("material-darker")
		end
	end,
}
