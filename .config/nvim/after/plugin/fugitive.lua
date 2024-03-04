local wk = require('which-key')

wk.register({
	g = {
		name = 'Git',
		b = { ':Git blame<CR>', 'Git Blame' },
		d = { ':Gdiffsplit HEAD^<CR>', 'Git Diff' }
	}
}, {
	prefix = '<leader>',
	mode = 'n'
})

