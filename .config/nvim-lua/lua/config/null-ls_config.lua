require("null-ls").setup({
    sources = {
        require("null-ls").builtins.diagnostics.shellcheck,
        require("null-ls").builtins.code_actions.shellcheck,
        require("null-ls").builtins.diagnostics.checkmake,
        require("null-ls").builtins.diagnostics.rstchk,
        require("null-ls").builtins.diagnostics.gitlint,
    },
})
