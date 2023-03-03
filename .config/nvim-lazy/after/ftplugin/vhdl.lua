vim.cmd([[set complete-=t]])
local ok, cmp = pcall(require,'cmp')
if ok then
  cmp.setup.buffer{
    sources = cmp.config.sources({
      { name = 'ultisnips'}, -- For ultisnips users.
      { name = 'buffer'},
      { name = 'path' },
      { name = 'calc' },
    })
  }
end
