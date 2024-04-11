return require('packer').startup(function(use)
	use('wbthomason/packer.nvim')
	use({
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		requires = {
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-telescope/telescope-fzf-native.nvim' }
		}
	})
	use('shaunsingh/nord.nvim')
	use({
		'folke/trouble.nvim',
		requires = {
			{ 'nvim-tree/nvim-web-devicons' }
		},
		signs = {
			error = '✘',
			warning = '',
			hint = '',
			information = '',
			other = '',
		},
		use_diagnostic_signs = false,
		opts = { }
	})
	use({
		'folke/todo-comments.nvim',
		requires = {
			{ 'nvim-lua/plenary.nvim' }
		},
		opts = { }
	})

	use({
		'nvim-lualine/lualine.nvim',
		requires = {
			{ 'nvim-tree/nvim-web-devicons' }
		},
		options = {
			theme = 'nord'
		}
	})
	use('nvim-treesitter/nvim-treesitter')
	use('nvim-treesitter/playground')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
	use({
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			{ 'neovim/nvim-lspconfig' },

			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'L3MON4D3/LuaSnip' }
		}
	})
	use({
		'folke/noice.nvim',
		requires = {
			{ 'MunifTanjim/nui.nvim' },
			{ 'rcarriga/nvim-notify' }
		}
	})
	use({
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v3.x',
		requires = { 
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-tree/nvim-web-devicons' },
			{ 'MunifTanjim/nui.nvim' }
		}
	})
	use({
		'folke/which-key.nvim',
		requires = {
			{ 'folke/trouble.nvim' },
			{ 'nvim-telescope/telescope.nvim' },
			{ 'folke/todo-comments.nvim' }
		}
	})
end)

