vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'nvim-lua/plenary.nvim'

    use {
        'christoomey/vim-tmux-navigator',
        lazy = false
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        "catppuccin/nvim",
        as = "catppuccin"
    }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/nvim-tree-docs')

    use {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use('onsails/lspkind.nvim')

    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use('williamboman/mason.nvim')


    use('williamboman/mason-lspconfig.nvim')

    -- LSP Support
    use('neovim/nvim-lspconfig')
    -- Autocompletion
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-nvim-lsp-signature-help')
    use('hrsh7th/cmp-nvim-lua')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    use('hrsh7th/cmp-cmdline')
    use('L3MON4D3/LuaSnip')
end)
