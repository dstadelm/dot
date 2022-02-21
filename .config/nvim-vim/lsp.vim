call minpac#add('neovim/nvim-lspconfig', {'type': 'opt'})
call minpac#add('glepnir/lspsaga.nvim', {'type': 'opt'})
packadd nvim-lspconfig
packadd lspsaga.nvim

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
nnoremap <silent> gx    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
"nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>

autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync()
" individual settings on filetype basis are done in after/ftplugin/<ftype.lua>

lua <<EOF
vim.lsp.handlers["textDocument/hover"] =
  vim.lsp.with(
  vim.lsp.handlers.hover,
  {
    border = "single"
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] =
  vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {
    border = "single"
  }
)
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
  local configs = require'lspconfig.configs'

  if not configs.vhdl_ls then
    configs["vhdl_ls"] = {
      default_config = {
        cmd = { '/home/dstadelmann/rust/rust_hdl/target/release/vhdl_ls'},
        filetypes = {'vhdl'},
        root_dir = function(fname)
          return lspconfig.util.find_git_ancestor(fname)
        end,
        autostart = true,
      };
    }
  end
  lspconfig.vhdl_ls.setup{}

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

  local servers = {'vimls', 'clangd'}
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup{
    capabilities = capabilities
    }
  end
  -- settings can be found at https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#yamlls
  lspconfig.yamlls.setup{
    capabilities = capabilities,
    settings = {
      yaml = {
        schemas = {
          ["/home/dstadelmann/regenor-yaml/tmp.schema.json"] = "/home/dstadelmann/regenor-yaml/*"
        },
        customTags = {"!include scalar"},
      },
    }
  }

  lspconfig.pylsp.setup{
    capabilities = capabilities,
    filetypes = {"python"},
    settings = {
      formatCommand = {"black"}
      }
  }

EOF

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ToDo
" - checkout nvim-lspfuzzy https://github.com/ojroques/vim-lspfuzzy
" - lsp-signature
