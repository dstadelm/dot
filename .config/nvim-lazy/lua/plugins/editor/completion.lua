local pc = require('plugin_configuration')
return {

  -- Ultisnips Interferes with tab keymap
  {
    'hrsh7th/nvim-cmp',
    enabled = pc.nvim_cmp,
    name = 'nvim-cmp',
    dependencies = {
      {
        'SirVer/ultisnips',
        name = 'ultisnips',
        init = function()
          vim.g.UltiSnipsExpandTrigger = '<C-k>'
          vim.g.UltiSnipsJumpForwardTrigger = '<C-k>'
          vim.g.UltiSnipsJumpBackwardTrigger = '<C-j>'
        end
      },
      'honza/vim-snippets',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-calc',
      'lukas-reineke/cmp-under-comparator',
      'hrsh7th/cmp-cmdline',
      {
        'quangnguyen30192/cmp-nvim-ultisnips',
        config = true,
      },
      'onsails/lspkind-nvim',
      'hrsh7th/cmp-nvim-lsp-signature-help',
    },
    config = function(plugin, opts)
      local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

      vim.o.completeopt = 'menu,menuone,noselect'
      local lspkind = require('lspkind')
      local cmp = require 'cmp'
      cmp.setup({
        formatting = {
          fields = { "abbr", "kind", "menu" },
          format = lspkind.cmp_format({
            mode = 'symbol', -- text, text_symbol, symbol_text, symbol
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          })
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        completion = {
          completeopt = 'menu,menuone,noselect',
          keyword_length = 1,
          -- autocomplete = false,
        },
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs( -4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<C-k>"] = cmp.mapping(
            function(fallback)
              cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
            end,
            { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
          ),
          ["<C-j>"] = cmp.mapping(
            function(fallback)
              cmp_ultisnips_mappings.jump_backwards(fallback)
            end,
            { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
          ),
        }),
        sources = cmp.config.sources {
          { name = 'nvim_lsp' },
          { name = 'ultisnips' }, -- For ultisnips users.
          { name = 'buffer',
            option = {
              -- get_bufnrs = function()
              --   return vim.api.nvim_get_current_()
              -- end
            }
          },
          { name = 'path' },
          { name = 'calc' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'neorg' },
        }
      })

      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })
    end,
  },
  {
    'abecodes/tabout.nvim',
    enabled = pc.tabout and pc.treesitter,
    name = 'tabout',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'ultisnips', -- ultisnips has to be configured first otherwise there is a conflict due to ultisnips grabbing the tab
      'nvim-cmp',
    },
    config = function()
      vim.g.UltiSnipsExpandTrigger = '<C-k>'
      vim.g.UltiSnipsJumpForwardTrigger = '<C-k>'
      vim.g.UltiSnipsJumpBackwardTrigger = '<C-j>'
      require('tabout').setup(
        {
          tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
          backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
          act_as_tab = true, -- shift content if tab out is not possible
          act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
          default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
          default_shift_tab = '<C-d>', -- reverse shift default action,
          enable_backwards = true, -- well ...
          completion = true, -- if the tabkey is used in a completion pum
          tabouts = {
            { open = "'", close = "'" },
            { open = '"', close = '"' },
            { open = '`', close = '`' },
            { open = '(', close = ')' },
            { open = '[', close = ']' },
            { open = '{', close = '}' }
          },
          ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
          exclude = {} -- tabout will ignore these filetypes
        }
      )
    end,
  }
}
