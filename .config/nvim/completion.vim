call minpac#add('hrsh7th/nvim-compe', {'type': 'opt'})
packadd nvim-compe

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

set completeopt=menuone,noselect

lua <<EOF
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
  sort = { priority = 500; };
  tags = { priority = 500; };
  spell = { priority = 500; };
  path = { priority = 500; };
  buffer = { priority = 500; };
  calc = { priority = 500; };
  nvim_lsp = { priority = 500; };
  nvim_lua = { priority = 500; };
  ultisnips = { priority = 500; };
  nvim_treesitter = { priority = 500; };
  };

}
EOF
