require('dap-python').setup('/usr/bin/python3.8')
vim.cmd[[
nnoremap <silent> <leader>dc :lua require'dap'.continue()<CR>
nnoremap <silent> <leader>dso :lua require'dap'.step_over()<CR>
nnoremap <silent> <leader>dsi :lua require'dap'.step_into()<CR>
nnoremap <silent> <leader>dsu :lua require'dap'.step_out()<CR>

nnoremap <silent> <leader>db :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <leader>dtm :lua require('dap-python').test_method()<CR>
nnoremap <silent> <leader>dtc :lua require('dap-python').test_class()<CR>
vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>

nnoremap <silent> <leader>dh :lua require('dap.ui.widgets').hover()<CR>
]]
table.insert(require('dap').configurations.python, {
  type = 'python',
  request = 'launch',
  name = 'My custom launch configuration',
  program = '${file}',
  pythonPath = '/usr/bin/python3.8'
  -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
})
