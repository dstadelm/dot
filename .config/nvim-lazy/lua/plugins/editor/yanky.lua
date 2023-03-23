return {
  'gbprod/yanky.nvim',
  enabled = require('config').is_enabled("yanky"),
  lazy = true,
  keys = {
    {"p", "<Plug>(YankyPutAfter)", mode = {'n', 'x'}, desc = "Yank put after"},
    {"P", "<Plug>(YankyPutBefore)", mode = {'n', 'x'}, desc = "Yank put before"},
    {"gp", "<Plug>(YankyGPutAfter)", mode = {'n', 'x'}, desc = "Yank put after, with cursor at end"},
    {"gP", "<Plug>(YankyGPutBefore)", mode = {'n', 'x'}, desc = "Yank put before, with cursor at end"},
    {"<c-n>", "<Plug>(YankyCycleForward)", desc = "Yanky cycle forward"},
    {"<c-p>", "<Plug>(YankyCycleBackward)", desc = "Yanky cycle backward"},
  },
  config = function()
    if require('telescope') then
      require('telescope').load_extension("yank_history")
    end
    require("yanky").setup({
      ring = {
        history_length = 100,
        storage = "shada",
        sync_with_numbered_registers = true,
        cancel_event = "update",
      },
      system_clipboard = {
        sync_with_ring = true,
      },
    })
  end
}
