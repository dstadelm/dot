return {
  "jose-elias-alvarez/null-ls.nvim",
  enabled = require("config").is_enabled("null_ls"),
  lazy = false,
  -- event = "VeryLazy",
  config = function()
    local null_ls = require("null-ls")
    -- register any number of sources simultaneously
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions
    local formatting = null_ls.builtins.formatting
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    local sources = {
      code_actions.shellcheck,
      diagnostics.shellcheck,
      diagnostics.checkmake,
      diagnostics.chktex,
      diagnostics.gitlint,
      formatting.latexindent,
      formatting.isort,
      formatting.black, -- .with({ extra_args = {"--line-length", "120"}}),
      formatting.stylua,
    }

    null_ls.setup({
      sources = sources,
      -- on_attach = function(client, bufnr)
      --   print("Hello null_ls " .. client.name)
      --   if client.name == "pylsp" or client.name == "pyright" then
      --     client.resolved_capabilities.document_formatting = false
      --   end
      --   if client.name == "lua_ls" then
      --     print("Hello null_ls " .. client.name)
      --     client.resolved_capabilities.document_formatting = false
      --   end
      --
      --   if client.supports_method("textDocument/formatting") then
      --     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      --     vim.api.nvim_create_autocmd("BufWritePre", {
      --       group = augroup,
      --       callback = function()
      --         vim.lsp.buf.format()
      --       end,
      --     })
      --   end
      -- end,
    })
  end,
}
