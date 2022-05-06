vim.cmd("autocmd BufWritePre *.rb lua vim.lsp.buf.formatting_sync()")
