local pc = require('plugin_configuration')
return {
  {
    'dstadelm/vim-vunit',
    enabled = pc.vunit,
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
    config= function()
      local nnoremap = require("utils").nnoremap
      nnoremap("<leader>vr", ":VunitRunTestWithFzf<cr>")
      nnoremap("<leader>vg", ":VunitRunTestWithFzfInGui<cr>")
      nnoremap("<leader>vl", ":VunitUpdateTestList<cr>")
      nnoremap("<leader>rr", ":VunitReRunSelectedTests<cr>")
    end
  },
  {
    'dstadelm/simple-vhdl.vim',
    enabled = pc.simple_vhdl,
  },
  {
    'trmckay/based.nvim',
    enabled = pc.based,
    keys = {
      {"<leader>B<space>", function() require('based').convert() end, desc = "Convert value between hex/dec, detect automatically"},
      {"<leader>Bh", function() require('based').convert("hex") end, desc = "Convert value from hex to dec"},
      {"<leader>Bd", function() require('based').convert("dec") end, desc = "Convert value from dec to hex"}
    }
  }
}
