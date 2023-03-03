local M = {}

function M.find_nvim_config()
  local opts = {}
  opts.search_dirs = {'~/.config/nvim/'}
  opts.prompt_title = 'Neovim Config Files'
  opts.prompt_prefix = ''
  require'telescope.builtin'.find_files(opts)
end

local live_grep_in_glob = function(glob_pattern)
  require('telescope.builtin').live_grep({
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--glob=" .. (glob_pattern or ""),
    }
  })
end

M.live_grep_in_glob = function()
  vim.ui.input({ prompt = "Glob: ", completion = "file", default = "**/*." }, live_grep_in_glob)
end

return M
