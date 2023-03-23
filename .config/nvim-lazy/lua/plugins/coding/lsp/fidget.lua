return {
  'j-hui/fidget.nvim',       -- progress animation of lsp server
  lazy = true,
  event = {"LspAttach"},
  enabled = require('config').is_enabled("fidget"),
  opts = {}
}
