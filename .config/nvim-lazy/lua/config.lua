local M = {}

M.colorscheme = "material"

local nvim = {
	notes = {
		enabled = true,
		plugins = {
			markdown_preview = true,
			peek = true,
			neorg = true,
			vimwiki = true,
			headlines = true,
		},
	},
	editor = {
		enabled = true,
		plugins = {
			stcursorword = false,
			undotree = true,
			eunuch = true,
			vinegar = true,
			easy_align = true,
			indent_blankline = true,
			exchange = true,
			yanky = true,
			dial = true,
			hydra = true,
			colorizer = true,
			treesitter = true,
			treesj = true,
			replacer = true,
		},
		completion = {
			enabled = true,
			plugins = {
				tabout = true,
				nvim_cmp = true,
			},
		},
		git = {
			enabled = true,
			plugins = {
				diffview = true,
				fugitiv = true,
				flog = true,
				gitsigns = true,
				git_worktree = true,
			},
		},
	},
	coding = {
		enabled = true,
		plugins = {
			projectionist = true,
			surround = true,
			comment = true,
			autopairs = true,
			iswap = true,
			cheat_sh = true,
			neotest = true,
			vunit = true,
			simple_vhdl = true,
			treepin = true,
			based = true,
		},
		lsp = {
			enabled = true,
			plugins = {
				lspconfig = true,
				lspsaga = true,
				neoconf = true,
				neodev = true,
				mason = true,
				trouble = true,
				null_ls = true,
				fidget = true, -- standalone ui for nvim-lsp progress
			},
		},
		dap = {
			enabled = true,
			plugins = {
				nvim_dap = true,
				nvim_dap_python = true,
			},
		},
	},
	colorschemes = {
		enabled = true,
		plugins = {
			ayu = true,
			neon = true,
			vscode = true,
			darcula = true,
			onedark = true,
			sonokai = true,
			doom = true,
			kanagawa = true,
			material = true,
			nightfox = true,
			oxocarbon = true,
			catppuccin = true,
			tokyonight = true,
		},
	},
	ui = {
		enabled = true,
		plugins = {
			maximize_window_toggle = true,
			comfortable_motion = true,
			toggleterm = true,
			notify = true,
			noice = false,
			alpha = true,
			lualine = true,
			telescope = true,
			which_key = true,
			dressing = true,
		},
	},
}

local function bool2str(val)
	if val then
		return "enabled"
	end
	return "disabled"
end

local function walk_table(table, group_enabled)
	if group_enabled == nil then
		group_enabled = true
	end
	return coroutine.wrap(function()
		for k, v in pairs(table) do
			if k ~= "enabled" and type(v) == "boolean" then
				coroutine.yield(k, v and group_enabled)
			end
			if type(v) == "table" then
				for p, e in walk_table(v, (table.enabled and group_enabled)) do
					coroutine.yield(p, e)
				end
			end
		end
	end)
end

local flat_table = nil

local function flatten_table()
	if flat_table == nil then
		flat_table = {}
		for p, e in walk_table(nvim, true) do
			flat_table[p] = e
		end
	end
end

function M.is_enabled(plugin)
	flatten_table()
	if flat_table[plugin] == true then
		return true
	end
	return false
end

function M.get_colorscheme_priority(plugin)
	if plugin == M.colorscheme then
		return 1000
	end
	return 50
end

function M.get_colorscheme_lazy(plugin)
	if plugin == M.colorscheme then
		return false
	end
	return true
end

function M.is_default_colorscheme(plugin)
	if plugin == M.colorscheme then
		return true
	end
	return false
end

return M
