local pc = require('plugin_configuration')
return {
  {
    'tpope/vim-projectionist',
    enabled = pc.projectionist,
  },
  {
    'kylechui/nvim-surround',
    enabled = pc.surround,
    config = true,
  },
  {
    'numToStr/Comment.nvim',
    enabled = pc.comment,
    config = true,
  },

  {
    "windwp/nvim-autopairs",
    enabled = pc.autopairs,
    config = true,
  },
  {
    'mizlan/iswap.nvim',
    enabled = pc.iswap and pc.treesitter,
    dependencies = {
      'nvim-treesitter/nvim-treesitter'
    }
  },
  {
    'dbeniamine/cheat.sh-vim',
    enabled = pc.cheat_sh,
  },
  -- testing
  {
    'nvim-neotest/neotest',
    enabled = pc.neotest and pc.treesitter,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-neotest/neotest-python',
    },
    config = function()
      require("neotest").setup({
        icons = {
          child_indent = "│",
          child_prefix = "├",
          collapsed = "─",
          expanded = "╮",
          failed = "✖",
          final_child_indent = " ",
          final_child_prefix = "╰",
          non_collapsible = "─",
          passed = "✔",
          running = "🗘",
          running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
          skipped = "ﰸ",
          unknown = "?"
        },
        adapters = {
          require("neotest-python")({
          }),
        },
      })
    end,
  }
}
