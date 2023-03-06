local pc = require('plugin_configuration')
return {
  {
    'vimwiki/vimwiki',
    enabled = pc.vimwiki,
    config = function()
      vim.cmd([[let g:vimwiki_listsyms = '✗○◐●✓']])
      vim.cmd([[let g:vimwiki_ext2syntax = {'.wiki': 'media'}]])
    end
  },
  {
    "nvim-neorg/neorg",
    enabled = pc.neorg,
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'lukas-reineke/headlines.nvim',
        dependencies = {
          'treesitter'
        },
        opts = {
          norg = {
            headline_highlights = { "Headline1", "Headline2", "Headline3", "Headline4", "Headline5", "Headline6" },
            codeblock_highlight = { "NeorgCodeBlock" },
          }
        },
      },
      {
        'folke/zen-mode.nvim' },
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        window = {
          backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
          -- height and width can be:
          -- * an absolute number of cells when > 1
          -- * a percentage of the width / height of the editor when <= 1
          -- * a function that returns the width or the height
          width = 0.8, -- width of the Zen window
          height = 0.8, -- height of the Zen window
          -- by default, no options are changed for the Zen window
          -- uncomment any of the options below, or add other vim.wo options you want to apply
          options = {
            signcolumn = "no", -- disable signcolumn
            number = false, -- disable number column
            relativenumber = false, -- disable relative numbers
            cursorline = false, -- disable cursorline
            cursorcolumn = false, -- disable cursor column
            foldcolumn = "0", -- disable fold column
            list = false, -- disable whitespace characters
          },
        }
      }
    },
    build = ":Neorg sync-parsers",
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.norg.dirman"] = {
          config = {
            workspaces = {
              work = "~/notes/work",
              home = "~/notes/home",
            }
          }
        },
        -- ["core.norg.completion"] = {
        --   config = {
        --     engine = "nvim-cmp"
        --   }
        -- },
        ["core.norg.concealer"] = {},
        ["core.presenter"] = { config = { zen_mode = "zen-mode" } },
        ["core.norg.qol.toc"] = { config = { default_split_mode = "split" } }
      }
    },
    config = function(_, opts)
      local ok, _ = pcall(require, 'cmp')
      if ok then
        vim.tbl_extend("keep", opts.load, {
            ["core.norg.completion"] = {
              config = {
                engine = "nvim-cmp"
              }
          }
        })
      end
      require('neorg').setup(opts)
    end

  },
  {
    'iamcco/markdown-preview.nvim',
    enabled = pc.markdown_preview,
    build = 'cd app && yarn install',
    cmd = 'MarkdownPreview',
    init = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { 'markdown' }
  }
}