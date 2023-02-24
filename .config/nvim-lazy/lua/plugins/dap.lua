local pc = require('plugin_configuration')
return {
  {
    'mfussenegger/nvim-dap',
    name = 'nvim-dap',
    enabled = pc.nvim_dap,
    dependencies = {
      {
        'rcarriga/nvim-dap-ui',
        config = function()
          local nnoremap = require("utils").nnoremap
          require("dapui").setup()
          nnoremap("<leader>duo", ':lua require("dapui").open()<CR>', { silent = false })
          nnoremap("<leader>duc", ':lua require("dapui").close()<CR>', { silent = false })
          nnoremap("<leader>dut", ':lua require("dapui").toggle()<CR>', { silent = false })
          nnoremap("<leader>de", ':lua require("dapui").eval()<CR>', { silent = false })
        end,
      },
      {
        'williamboman/mason.nvim',
        enabled = pc.mason,
        dependencies = {
          'jay-babu/mason-nvim-dap.nvim',
        }
      }

    },
    config = function()
      require('dap')
      vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
      vim.fn.sign_define('DapStopped', { text = '🔶', texthl = '', linehl = '', numhl = '' })
    end,
  },
  {
    'mfussenegger/nvim-dap-python',
    enabled = pc.nvim_dap_python and pc.nvim_dap,
    dependencies = {
      'nvim-dap',
    },
    config = function()
      require('dap-python').setup('/usr/bin/python3.10')
      vim.cmd [[
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
      -- table.insert(require('dap').configurations.python, {
      --   type = 'python',
      --   request = 'launch',
      --   name = 'My custom launch configuration',
      --   program = '${file}',
      --   pythonPath = '/usr/bin/python3.10'
      --   -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
      -- })
    end,
  },
}
