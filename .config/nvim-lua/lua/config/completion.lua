require("cmp_nvim_ultisnips").setup{}
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

vim.o.completeopt='menu,menuone,noselect'
local lspkind = require('lspkind')
local cmp = require'cmp'
local types = require('cmp.types')
cmp.setup({
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
    })
  },
  completion = {
    completeopt = 'menu,menuone,noselect',
  --  autocomplete = true,
  },
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },

    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
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
  -- mapping = {

  --   ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Insert }), { 'i', 'c' }),
  --   ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Insert }), { 'i', 'c' }),
  --   ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
  --   ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
  --   ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
  --   ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
  --   ['<C-e>'] = cmp.mapping({
  --     i = cmp.mapping.abort(),
  --     c = cmp.mapping.close(),
  --   }),
  --   ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  --   ["<C-k>"] = cmp.mapping(
  --     function(fallback)
  --       cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
  --     end,
  --     { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
  --   ),
  --   ["<C-j>"] = cmp.mapping(
  --     function(fallback)
  --       cmp_ultisnips_mappings.jump_backwards(fallback)
  --     end,
  --     { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
  --   ),
  -- },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'ultisnips'}, -- For ultisnips users.
  }, {
    { name = 'buffer' },
    { name = 'path' },
    { name = 'calc' },
    --{ name = 'nvim_lsp_signature_help' },
  })
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

