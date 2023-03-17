local pc = require('plugin_configuration')

local function window_number()
  local win = vim.api.nvim_get_current_win()
  return vim.api.nvim_win_get_number(win)
end

local function file_type_condition()
  return function()
    for _, value in pairs({"floggraph", "git"}) do
      if string.find(vim.bo.filetype, value) then
        return false
      end
    end
  return true
  end
end

return {
  'nvim-lualine/lualine.nvim',
  enabled = pc.lualine,
  lazy = true,
  event = "VeryLazy",
  dependencies = {
    'kyazdani42/nvim-web-devicons'
  },
  opts =
  {
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = { left = '\\', right = '/' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = {
        statusline = {},
        winbar = {
          "dap-repl",
          "dapui_console",
          "dapui_watches",
          "dapui_stacks",
          "dapui_breakpoints",
          "dapui_scopes",
        },
        'alpha',
        -- 'floggraph',
      },
      always_divide_middle = true,
      globalstatus = true,
    },
    sections = {
      lualine_a = { 'mode', },
      lualine_b = { 'branch' },
      -- lualine_b = { 'branch', 'diff', 'diagnostics' },
      -- lualine_c = { '%=', { 'filename', path = 3, separator = { left = '-', right = '-' } } },
      lualine_c = {},
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' }
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    inactive_winbar = {
      lualine_a = {},
      lualine_b = {
        { 'filetype', icon_only = true, separator = { right = '', left = '' } },
        {
          'filename',
          path = 0,
          separator = { right = '', left = '' },
          cond = file_type_condition(),
        } },
      lualine_c = {},
      lualine_y = {},
      lualine_x = {},
      lualine_z = { window_number }
    },
    winbar = {
      lualine_a = {},
      lualine_b = {
        { 'filetype', icon_only = true, separator = { right = '', left = '' } },
        {
          'filename',
          path = 0,
          separator = { right = '', left = '' },
          cond = file_type_condition(),
        } },
      lualine_c = { 'diff' },
      lualine_x = {},
      -- lualine_c = { {'%=', 'diff', 'diagnostics', separator = {left = '/', right = '/'}}},
      lualine_y = { 'diagnostics' },
      lualine_z = { window_number },
    },
    extensions = { 'quickfix', 'nvim-dap-ui' }
  }
}
