call minpac#add('mfussenegger/nvim-dap', {'type': 'opt'})
call minpac#add('mfussenegger/nvim-dap-python', {'type': 'opt'})
call minpac#add('nvim-telescope/telescope-dap.nvim', {'type': 'opt'})
packadd nvim-dap
packadd nvim-dap-python
packadd telescope-dap.nvim

nnoremap <silent> <leader>dct :lua require"dap".continue()<CR>
nnoremap <silent> <leader>dsv :lua require"dap".step_over()<CR>
nnoremap <silent> <leader>dsi :lua require"dap".step_into()<CR>
nnoremap <silent> <leader>dso :lua require"dap".step_out()<CR>
nnoremap <silent> <leader>dtb :lua require"dap".toggle_breakpoint()<CR>

nnoremap <silent> <leader>dsc :lua require"dap.ui.variables".scopes()<CR>
nnoremap <silent> <leader>dhh :lua require"dap.ui.variables".hover()<CR>
vnoremap <silent> <leader>dhv :lua require"dap.ui.variables".visual_hover()<CR>

nnoremap <silent> <leader>duh :lua require"dap.ui.widgets".hover()<CR>
nnoremap <silent> <leader>duf', "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>")

nnoremap <silent> <leader>dsbr :lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>
nnoremap <silent> <leader>dsbm :lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>
nnoremap <silent> <leader>dro :lua require"dap".repl.open()<CR>
nnoremap <silent> <leader>drl :lua require"dap".repl.run_last()<CR>


" telescope-dap
nnoremap <silent> <leader>dcc :lua require"telescope".extensions.dap.commands{}<CR>
nnoremap <silent> <leader>dco :lua require"telescope".extensions.dap.configurations{}<CR>
nnoremap <silent> <leader>dlb :lua require"telescope".extensions.dap.list_breakpoints{}<CR>
nnoremap <silent> <leader>dv :lua require"telescope".extensions.dap.variables{}<CR>
nnoremap <silent> <leader>df :lua require"telescope".extensions.dap.frames{}<CR>equire('telescope').load_extension('dap')

nnoremap <silent> <leader>dct :lua require"dap".continue()<CR>
nnoremap <silent> <leader>dsv :lua require"dap".step_over()<CR>
nnoremap <silent> <leader>dsi :lua require"dap".step_into()<CR>
nnoremap <silent> <leader>dso :lua require"dap".step_out()<CR>
nnoremap <silent> <leader>dtb :lua require"dap".toggle_breakpoint()<CR>

nnoremap <silent> <leader>dsc :lua require"dap.ui.variables".scopes()<CR>
nnoremap <silent> <leader>dhh :lua require"dap.ui.variables".hover()<CR>
vnoremap <silent> <leader>dhv :lua require"dap.ui.variables".visual_hover()<CR>

nnoremap <silent> <leader>duh :lua require"dap.ui.widgets".hover()<CR>
nnoremap <silent> <leader>duf', "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>")

nnoremap <silent> <leader>dsbr :lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>
nnoremap <silent> <leader>dsbm :lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>
nnoremap <silent> <leader>dro :lua require"dap".repl.open()<CR>
nnoremap <silent> <leader>drl :lua require"dap".repl.run_last()<CR>


" telescope-dap
nnoremap <silent> <leader>dcc :lua require"telescope".extensions.dap.commands{}<CR>
nnoremap <silent> <leader>dco :lua require"telescope".extensions.dap.configurations{}<CR>
nnoremap <silent> <leader>dlb :lua require"telescope".extensions.dap.list_breakpoints{}<CR>
nnoremap <silent> <leader>dv :lua require"telescope".extensions.dap.variables{}<CR>
nnoremap <silent> <leader>df :lua require"telescope".extensions.dap.frames{}<CR>

lua <<EOF
local dap = require('dap')
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
require('telescope').load_extension('dap')

require('dap')
vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
local dap = require('dap')
dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python3.8'
      end
    end;
  },
}
EOF
