"call minpac#add('hrsh7th/nvim-compe', {'type': 'opt'})
"packadd nvim-compe
"
"inoremap <silent><expr> <C-Space> compe#complete()
"inoremap <silent><expr> <CR>      compe#confirm('<CR>')
"inoremap <silent><expr> <C-e>     compe#close('<C-e>')
"inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
"inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
"
"set completeopt=menuone,noselect
"
"lua <<EOF
"require'compe'.setup {
"  enabled = true;
"  autocomplete = true;
"  debug = false;
"  min_length = 0;
"--  preselect = 'enable';
"  throttle_time = 80;
"  source_timeout = 200;
"  incomplete_delay = 400;
"  max_abbr_width = 100;
"  max_kind_width = 100;
"  max_menu_width = 100;
"  documentation = true;
"
"  source = {
"  sort = { priority = 500; };
"  tags = { priority = 500; };
"  spell = { priority = 500; };
"  path = { priority = 500; };
"--  buffer = { priority = 500; };
"  calc = { priority = 500; };
"  nvim_lsp = { priority = 500; };
"  nvim_lua = { priority = 500; };
"--  ultisnips = { priority = 500; };
"  nvim_treesitter = { priority = 500; };
"  omni = { filetypes = {'tex'};
"           priority = 500;
"         };
"  };
"
"}
"EOF

call minpac#add('hrsh7th/cmp-nvim-lsp', {'type': 'opt'})
call minpac#add('hrsh7th/cmp-buffer'  , {'type': 'opt'})
call minpac#add('hrsh7th/cmp-path'    , {'type': 'opt'})
call minpac#add('hrsh7th/cmp-cmdline' , {'type': 'opt'})
call minpac#add('hrsh7th/nvim-cmp'    , {'type': 'opt'})

packadd nvim-cmp
packadd cmp-nvim-lsp
packadd cmp-buffer
packadd cmp-path
packadd cmp-cmdline

" For vsnip users.
" Plug 'hrsh7th/cmp-vsnip'
" Plug 'hrsh7th/vim-vsnip'

" For luasnip users.
" Plug 'L3MON4D3/LuaSnip'
" Plug 'saadparwaiz1/cmp_luasnip'

" For ultisnips users.
call minpac#add('quangnguyen30192/cmp-nvim-ultisnips', {'type': 'opt'})
packadd cmp-nvim-ultisnips

" For snippy users.
" Plug 'dcampos/nvim-snippy'
" Plug 'dcampos/cmp-snippy'

set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'ultisnips' }, -- For ultisnips users.
    }, {
     { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })


EOF
