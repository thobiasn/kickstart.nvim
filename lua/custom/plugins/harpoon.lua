return {
  'ThePrimeagen/harpoon',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local mark = require('harpoon.mark')
    local ui = require('harpoon.ui')

    vim.keymap.set('n', '<leader>h', function() end, { desc = '[H]arpoon' })

    vim.keymap.set('n', '<leader>ha', mark.add_file, { desc = '[H]arpoon [A]dd file' })
    vim.keymap.set('n', '<leader>ht', ui.toggle_quick_menu, { desc = '[H]arpoon [T]oggle menu (ctrl+e)' })
    vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

    vim.keymap.set('n', '<C-h>', function() ui.nav_file(1) end)
    vim.keymap.set('n', '<C-t>', function() ui.nav_file(2) end)
    vim.keymap.set('n', '<C-n>', function() ui.nav_file(3) end)
    vim.keymap.set('n', '<C-s>', function() ui.nav_file(4) end)
  end,
}
