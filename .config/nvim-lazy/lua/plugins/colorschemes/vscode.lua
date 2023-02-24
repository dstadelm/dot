local pc = require('plugin_configuration')
return {
  'Mofiqul/vscode.nvim',
  enabled = pc.vscode,
  config = function ()
    vim.g.vscode_style = "dark"
    -- For light theme
    --vim.g.vscode_style = "light"
    -- Enable transparent background
    -- vim.g.vscode_transparent = 0
    -- Enable italic comment
    vim.g.vscode_italic_comment = 1
    -- Disable nvim-tree background color
    -- vim.g.vscode_disable_nvimtree_bg = false
  end,
}
