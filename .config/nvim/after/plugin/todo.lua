local todo = require('todo-comments')

todo.setup()

vim.keymap.set('n', '<leader>td', '<cmd>TodoTelescope<CR>')
vim.keymap.set('n', '<leader>tdn',	function()
										todo.jump_next()
									end, { desc = 'Next todo comment' })
vim.keymap.set('n', '<leader>tdN', function()
										todo.jump_prev()
									end, { desc = 'Previous todo comment' })

