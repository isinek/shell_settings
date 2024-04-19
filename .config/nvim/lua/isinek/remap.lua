local keymap = vim.keymap

keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')
keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')

keymap.set('n', '<leader>y', '"+y')
keymap.set('v', '<leader>y', '"+y')
keymap.set('n', '<leader>Y', '"+Y')

-- Rename in Block
keymap.set('n', '<leader>rb', 'vap:s/\\<<C-r><C-w>\\>/<C-r><C-w>/gIc<Left><Left><Left>')
-- Rename in File
keymap.set('n', '<leader>rf', ':vimgrep "\\<<C-r><C-w>\\>" %<CR>:cdo s/\\<<C-r><C-w>\\>/<C-r><C-w>/gIc<Left><Left><Left><Left>')
-- Rename in Project
keymap.set('n', '<leader>rp', ':vimgrep "\\<<C-r><C-w>\\>" `find . -type f -regex ".*\\\\.\\\\(c\\\\|h\\\\|lua\\\\)$"`<CR>:cdo s/\\<<C-r><C-w>\\>/<C-r><C-w>/gIc<Left><Left><Left><Left>')

