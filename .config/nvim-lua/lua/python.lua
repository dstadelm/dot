vim.cmd("autocmd BufWritePre *.py lua vim.lsp.buf.format{ filter = function(client) return client.name ~= 'pylsp' end }")
vim.cmd[[
function! s:PyPostSave()
    execute "silent !tidy-imports --black --quiet --replace-star-imports --action REPLACE " . bufname("%")
    execute "silent !isort " . bufname("%")
    execute "e"
endfunction
:command! PyPostSave :call s:PyPostSave()
nnoremap <leader>aa :w<CR>:PyPostSave<CR>
"autocmd BufWritePost *.py execute 'PyPostSave'
]]

