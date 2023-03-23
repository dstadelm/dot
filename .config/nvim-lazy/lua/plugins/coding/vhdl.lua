return {
  {
    'dstadelm/vim-vunit',
    enabled = require('config').is_enabled("vunit"),
    dependencies = {
      'junegunn/fzf.vim',
      dependencies = {
        'junegunn/fzf'
      },
      config = function()
        vim.cmd([[ au FileType fzf set nonu nornu
                   let $FZF_DEFAULT_OPTS='--layout=reverse'
                   let g:fzf_preview_window = ''
                ]])
      end

    },
    init = function()
      vim.g.VunitInvocationCmd = 'vunit'
      vim.g.VunitGuiPreCmd = 'export $(tmux show-env | grep disp);'
    end,
    keys = {
      { "<leader>vr", ":VunitRunTestWithFzf<cr>",       desc = "Run vunit tests with FZF" },
      { "<leader>vg", ":VunitRunTestWithFzfInGui<cr>",  desc = "Run vunit tests in GUI with FZF" },
      { "<leader>vl", ":VunitUpdateTestList<cr>",       desc = "Update test list" },
      { "<leader>rr", ":VunitReRunSelectedTests<cr>",   desc = "ReRun previous selected Tests" }
    }
  },
  {
    'dstadelm/simple-vhdl.vim',
    enabled = require('config').is_enabled("simple_vhdl"),
  },
  {
    'trmckay/based.nvim',
    enabled = require('config').is_enabled("based"),
    keys = {
      {"<leader>B<space>", function() require('based').convert() end, desc = "Convert value between hex/dec, detect automatically"},
      {"<leader>Bh", function() require('based').convert("hex") end, desc = "Convert value from hex to dec"},
      {"<leader>Bd", function() require('based').convert("dec") end, desc = "Convert value from dec to hex"}
    }
  }
}
