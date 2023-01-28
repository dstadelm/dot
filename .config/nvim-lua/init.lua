require('options')
require('keymaps')
require('augroup')
require('plugins')
require('python')
require('ruby')
---- configuration of the plugins
--vim.cmd("highlight Comment cterm=italic gui=italic")
-- vim.api.nvim_create_user_command("GitGraph", function()
--   package.loaded["git-graph"] = nil
--   require('git-graph').load_graph()
-- end
--   , {}
-- )
--
-- vim.api.nvim_create_user_command("GitGraphCommit", require("git-graph").open_commit, {})
