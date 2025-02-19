return {
	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	{
		"mbbill/undotree",
		keys = {
			{
				"<leader>u",
				":UndotreeToggle<CR>",
			},
		},
	},
	{ "nvim-tree/nvim-web-devicons" },
	{
		"rachartier/tiny-devicons-auto-colors.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		config = function()
			local theme_colors = require("catppuccin.palettes").get_palette('mocha')

			require("tiny-devicons-auto-colors").setup({
				colors = theme_colors,
			})
		end,
	},
	{
		"echasnovski/mini.surround",
		version = "*",
		config = true,
	},
}
