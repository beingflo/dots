-- Make 'jj' exit insert mode (acts like <Esc>)
vim.keymap.set('i', 'jj', '<Esc>', { desc = 'Escape insert mode with jj' })
