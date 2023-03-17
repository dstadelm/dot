local pc = require('plugin_configuration')
return {
  'iamcco/markdown-preview.nvim',
  enabled = pc.markdown_preview,
  build = 'cd app && yarn install',
  cmd = 'MarkdownPreview',
  init = function() vim.g.mkdp_filetypes = { "markdown" } end,
  ft = { 'markdown' }
}
