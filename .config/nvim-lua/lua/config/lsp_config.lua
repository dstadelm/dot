USER = vim.fn.expand('$USER')
local sumneko_root_path = "/home/" .. USER .. "/bin/lua-language-server"
local sumneko_binary = "/home/" .. USER .. "/bin/lua-language-server/bin/lua-language-server"

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
--
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
--  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'x', '<space>ca','<Esc><Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
end

local py_on_attach = function(client, bufnr)
  client.server_capabilities.document_formatting = false
  client.server_capabilities.document_range_formatting = false
  on_attach(client, bufnr)
end

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
    virtual_lines = false,
    signs = true,
    update_in_insert = false,
  }
)
-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())



local lspconfig = require'lspconfig'
local configs = require'lspconfig.configs'

if not configs.rust_hdl then
  configs.rust_hdl = {
    default_config = {
      cmd = { '/home/dstadelmann/rust/rust_hdl/target/release/vhdl_ls'};
      filetypes = {'vhdl'};
      root_dir = function(fname)
        return lspconfig.util.find_git_ancestor(fname)
        ------------------------------------------------------------
        -- alternatively one could define the toml file as root
        -- return lspconfig.util.root_pattern('vhdl_ls.toml')(fname)
      end;
      autostart = true,
      settings = {},
      flags = {
        allow_incremental_sync = true,
        debounce_text_changes = 5000,
      },
    },
  }
end

lspconfig.rust_hdl.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}


local servers = {'vimls', 'clangd', 'lemminx'}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup{
    on_attach = on_attach,
    capabilities = capabilities
  }
end
-- settings can be found at https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#yamlls
lspconfig.yamlls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = {
        ["/home/dstadelmann/regenor-yaml/newer.schema.json"] = "/home/dstadelmann/regenor-yaml/*"
      },
      customTags =  {'!include'} ,
    },
  }
}

require'lspconfig'.pyright.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

-- local util = require 'lspconfig.util'
-- require'lspconfig'.pylsp.setup{
--   on_attach = on_attach,
--   capabilities = capabilities,
--   root_dir = function(fname)
--     local root_files = {
--       'pyproject.toml',
--       'setup.py',
--       'setup.cfg',
--       'requirements.txt',
--       'Pipfile',
--     }
--     return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
--   end,
--   single_file_support = true,
--   settings = {
--     pylsp = {
--       plugins = {
--         -- https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md
--         pycodestyle = {enabled = false},
--         pydocstyle = {enabled = false},
--         autopep8 = {enabled = false},
--         flake8 = {enabled = false},
--         pyflakes = {enabled = false},
--         yapf = {enaboed = false},
--         pylint = {
--           enabled = true,
--           args = {'--rcfile', 'pyproject.toml' },
--         },
--         isort = {enabled = false},
--         pyls_mypy = {enabled = false},
--       }
--     }
--   }
-- }

require'lspconfig'.texlab.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}
local luadev = require("lua-dev").setup({
  -- add any options here, or leave empty to use the default settings
  lspconfig = {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  },
})

require'lspconfig'.sumneko_lua.setup(luadev)
