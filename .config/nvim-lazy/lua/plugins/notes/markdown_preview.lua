return {
  'iamcco/markdown-preview.nvim',
  enabled = require('config').is_enabled("markdown_preview"),
  build = 'cd app && yarn install',
  cmd = 'MarkdownPreview',
  init = function() vim.g.mkdp_filetypes = { "markdown" } end,
  ft = { 'markdown' }
}
