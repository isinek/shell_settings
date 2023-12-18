return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')

    use({
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
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
		}
    })

    use('nvim-treesitter/nvim-treesitter')
    use('nvim-treesitter/playground')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use ({
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
end)

