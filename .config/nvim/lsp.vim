call minpac#add('neovim/nvim-lspconfig', {'type': 'opt'})
call minpac#add('glepnir/lspsaga.nvim', {'type': 'opt'})
packadd nvim-lspconfig
packadd lspsaga.nvim

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
nnoremap <silent> gx    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K     <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
"nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
lua <<EOF
  -- nvim_lsb object

  -- local on_attach = function(client)
  --   require'completion'.on_attach(client)
  -- end


  -- Enable diagnostics
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = false,
      virtual_text = true,
      signs = true,
      update_in_insert = false,
    }
  )

  local lspconfig = require'lspconfig'
  local configs = require'lspconfig/configs'

  if not configs.vhdl_tool then
    configs.vhdl_tool = {
      default_config = {
        cmd = { '/home/dstadelmann/rust/rust_hdl/target/release/vhdl_ls'};
        filetypes = {'vhdl'};
        root_dir = function(fname)
          return lspconfig.util.find_git_ancestor(fname)
        end;
        settings = {};
      };
    }
  end
  lspconfig.vhdl_tool.setup{}
  local servers = {'vimls', 'pylsp', 'clangd'}
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup{
    }
  end



EOF

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ToDo
" - checkout nvim-lspfuzzy https://github.com/ojroques/vim-lspfuzzy
