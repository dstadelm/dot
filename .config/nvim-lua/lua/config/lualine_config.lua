require('lualine').setup {
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
      startify = {},
    },
    always_divide_middle = true,
    globalstatus = true,
  },

  sections = {
    lualine_a = { 'mode', },
    lualine_b = { 'branch'},
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
    lualine_b = {{'filetype', separator = { right = '', left = '' }}, { 'filename', path = 0, separator = { right = '', left = '' } }  },
    lualine_c = {},
    lualine_y = {},
    lualine_x = {},
    lualine_z = {}
  },
  winbar = {
    lualine_a = {},
    lualine_b = {  {'filetype', separator = { right = '', left = '' }} ,{ 'filename', path = 0, separator = { right = '', left = '' } }},
    lualine_c = {'diff'},
    lualine_x = {},
    -- lualine_c = { {'%=', 'diff', 'diagnostics', separator = {left = '/', right = '/'}}},
    lualine_y = { 'diagnostics'},
    lualine_z = {},
  },
  extensions = { 'quickfix', 'nvim-dap-ui' }
}
