local M = {}

vim.api.nvim_set_hl(0, 'WinBarInsertSeparator', { fg = '#61afef'})
vim.api.nvim_set_hl(0, 'WinBarInsertPath', { bg = '#61afef', fg = '#1f2328' })


vim.api.nvim_set_hl(0, 'WinBarNormalSeparator', { fg = '#98c379'})
vim.api.nvim_set_hl(0, 'WinBarNormalPath', { bg = '#98c379', fg = '#1f2328' })

vim.api.nvim_set_hl(0, 'WinBarCommandSeparator', { fg = '#c678dd'})
vim.api.nvim_set_hl(0, 'WinBarCommandPath', { bg = '#c678dd', fg = '#1f2328' })

vim.api.nvim_set_hl(0, 'WinBarVisualSeparator', { fg = '#e5c07b'})
vim.api.nvim_set_hl(0, 'WinBarVisualPath', { bg = '#e5c07b', fg = '#1f2328' })

function M.eval()
  local file_path = vim.api.nvim_eval_statusline('%f', {}).str
  local modified = vim.api.nvim_eval_statusline('%M', {}).str == '+' and '⊚' or ''
  local mode = vim.fn.mode()
  local mode_lookup = {
    v = 'Visual',
    V = 'Visual',
    i = 'Insert',
    n = 'Normal',
    c = 'Command',
  }

  local mode_string = mode_lookup[mode]

  if mode_string then
    file_path = file_path:gsub('/', '➤')

    return '%='
      .. '%#WinBar' .. mode_string .. 'Separator#'
      .. ''
      .. '%*'
      .. '%#WinBar' .. mode_string .. 'Path# '
      .. "%m %f"
      .. '%*'

    -- return ''
    --   .. '%#WinBar' .. mode_string .. 'Path# '
    --   .. "%m %f"
    --   .. '%*'
    --   .. '%#WinBar' .. mode_string .. 'Separator#'
    --   .. ''
    --   .. '%*'
  else
    return vim.o.winbar
  end
end

return M
