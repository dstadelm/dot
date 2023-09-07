local M = {}

function M.find_nvim_config()
	local opts = {}
	opts.search_dirs = { "~/.config/nvim" }
	opts.prompt_title = "Neovim Config Files"
	opts.prompt_prefix = ""
	-- opts.hidden = true
	require("telescope.builtin").find_files(opts)
end

local live_grep_in_glob = function(glob_pattern)
	require("telescope.builtin").live_grep({
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--glob=" .. (glob_pattern or ""),
		},
	})
end

M.live_grep_in_glob = function()
	vim.ui.input({ prompt = "Glob: ", completion = "file", default = "**/*." }, live_grep_in_glob)
end

function M.worktree_list()
	local obj = vim.system({
		"git",
		"worktree",
		"list",
	}, { text = true }, nil):wait()

	local entries = vim.fn.split(obj.stdout)
	local selection_table = {}
	local path = ""
	for index, value in pairs(entries) do
		if index % 3 == 1 then
			path = value
		elseif index % 3 == 0 then
			table.insert(selection_table, { value, path })
		end
	end
	return selection_table
end

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
M.worktree_picker = function(opts)
	opts = opts or {}
	pickers
		.new(opts, {
			prompt_title = "Worktrees",
			prompt_prefix = "",
			finder = finders.new_table({
				results = M.worktree_list(),
				entry_maker = function(entry)
					return {
						value = entry,
						display = entry[1],
						ordinal = entry[1],
					}
				end,
			}),
			sorter = conf.generic_sorter(opts),
			attach_mappings = function(prompt_bufnr, map)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					vim.cmd.tabnew(selection["value"][2])
					vim.cmd.cd(selection["value"][2])
				end)
				return true
			end,
		})
		:find()
end

return M
