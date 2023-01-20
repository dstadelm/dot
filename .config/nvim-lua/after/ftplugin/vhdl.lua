vim.cmd([[set complete-=t]])

local cmp = require'cmp'

cmp.setup.buffer{
    sources = cmp.config.sources({
    { name = 'ultisnips'}, -- For ultisnips users.
    { name = 'buffer' ,
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end
      }
    },
    { name = 'path' },
    { name = 'calc' },
    })
}
