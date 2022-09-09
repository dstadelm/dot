require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'onedarkpro',
    component_separators = { left = '\\', right = '/'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
      startify = {},
    },
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = {'mode',},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'%=', {'filename', path = 3, separator = {left = '-', right = '-'}}},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  inactive_winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'%=', {'filename', path = 3, separator = {left = '-', right = '-'}}},
    lualine_x = {'filetype'},
    lualine_y = {},
    lualine_z = {}
  },
  winbar = {
    -- lualine_a = {},
    -- lualine_b = {},
    -- lualine_c = {'%=', {'filename', path = 3, separator = {left = '-', right = '-'}}},
    -- lualine_x = {'filetype'},
    -- lualine_y = {},
    -- lualine_z = {}
  },
  extensions = {'quickfix'}
}
