local M = {}

function M.find_nvim_config()
  local opts = {}
  opts.search_dirs = {'~/.config/nvim/'}
  opts.prompt_title = 'Neovim Config Files'
  opts.prompt_prefix = ''
  require'telescope.builtin'.find_files(opts)
end

return M
