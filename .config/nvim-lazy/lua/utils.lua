local M = {}

function M.map(mode, lhs, rhs, opts)
    local options = { silent = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.nnoremap(lhs, rhs, opts)
    local options = { noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    M.map('n',lhs, rhs, options)
end

function M.inoremap(lhs, rhs, opts)
    local options = { noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    M.map('i',lhs, rhs, options)
end

function M.tnoremap(lhs, rhs, opts)
    local options = { noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    M.map('t',lhs, rhs, options)
end

function M.vnoremap(lhs, rhs, opts)
    local options = { noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    M.map('v',lhs, rhs, options)
end

function M.xnoremap(lhs, rhs, opts)
    local options = { noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    M.map('x',lhs, rhs, options)
end

function M.nmap(lhs, rhs, opts)
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    M.map('n',lhs, rhs, options)
end

function M.imap(lhs, rhs, opts)
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    M.map('i',lhs, rhs, options)
end

function M.tmap(lhs, rhs, opts)
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    M.map('t',lhs, rhs, options)
end

function M.vmap(lhs, rhs, opts)
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    M.map('v',lhs, rhs, options)
end

function M.xmap(lhs, rhs, opts)
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    M.map('x',lhs, rhs, options)
end

return M
