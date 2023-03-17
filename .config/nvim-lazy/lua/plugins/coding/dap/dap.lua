local pc = require('plugin_configuration')
return {
  {
    'mfussenegger/nvim-dap',
    name = 'nvim-dap',
    enabled = pc.nvim_dap,
    lazy = true,
    event = "VeryLazy",
    dependencies = {
      {
        'rcarriga/nvim-dap-ui',
        config = function()
          require("dapui").setup()
          -- nnoremap("<leader>duo", ':lua require("dapui").open()<CR>', { silent = false })
          -- nnoremap("<leader>duc", ':lua require("dapui").close()<CR>', { silent = false })
          -- nnoremap("<leader>dut", ':lua require("dapui").toggle()<CR>', { silent = false })
          -- nnoremap("<leader>de", ':lua require("dapui").eval()<CR>', { silent = false })
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
}
