require('gitsigns').setup{
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      local options = { silent = true}
      if opts then
        options = vim.tbl_extend("force", options, opts)
      end
      vim.api.nvim_set_keymap(mode, l, r, options)
    end

    -- -- Navigation
    map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
    map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

    -- -- Actions
    map('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map('v', '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map('v', '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>hS', ':Gitsigns stage_buffer<CR>')
    map('n', '<leader>hu', ':Gitsigns undo_stage_hunk<CR>')
    map('n', '<leader>hR', ':Gitsigns reset_buffer<CR>')
    map('n', '<leader>hp', ':Gitsigns preview_hunk<CR>')
    -- map('n', '<leader>hb', function() gs.blame_line{full=true} end)
    -- map('n', '<leader>tb', gs.toggle_current_line_blame)
    map('n', '<leader>hd', ':Gitsigns diffthis<CR>')
    -- map('n', '<leader>hD', function() gs.diffthis('~') end)
    -- map('n', '<leader>td', gs.toggle_deleted)

    -- -- Text object
    -- map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
