local baleia = require('baleia').setup{}
local colorize = function(...)
  baleia.once(vim.api.nvim_get_current_buf())
end
vim.api.nvim_create_user_command('BaleiaColorize', colorize, {})

