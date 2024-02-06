local keymap = vim.keymap

-- Explore files
keymap.set('n', '<leader>e', vim.cmd.Explore)
keymap.set('n', '<leader>he', vim.cmd.Hexplore)
keymap.set('n', '<leader>ve', vim.cmd.Vexplore)

-- Move line
keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Keep the cursor in the middle of the screen
keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')
keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')

-- Yank to buffer
keymap.set('n', '<leader>y', '"+y')
keymap.set('v', '<leader>y', '"+y')
keymap.set('n', '<leader>Y', '"+Y')

-- Rename variable
keymap.set('n', '<leader>r', ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Clear whitespaces
keymap.set('n', '<leader>cw', ":%s/[ \\t]\\+$//g<CR>")

-- Show hidden characters
keymap.set('n', '<leader>l', ":set invlist<CR>")

-- Set keymaps for next & previous diagnostic notification
keymap.set('n', '<leader>dn', vim.diagnostic.goto_next)
keymap.set('n', '<leader>dN', vim.diagnostic.goto_prev)
