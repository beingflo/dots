-- Make 'jj' exit insert mode (acts like <Esc>)
vim.keymap.set('i', 'jj', '<Esc>', { desc = 'Escape insert mode with jj' })

-- Cmd+S saves the file from any mode
vim.keymap.set('n', '<D-s>', '<Cmd>write<CR>',        { desc = 'Save file' })
vim.keymap.set('i', '<D-s>', '<C-o>:write<CR>',       { desc = 'Save file' })
vim.keymap.set('v', '<D-s>', '<Esc><Cmd>write<CR>gv', { desc = 'Save file and keep selection' })
vim.keymap.set('c', '<D-s>', '<C-c>:write<CR>',       { desc = 'Save file from command line' })
