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
			require("tiny-devicons-auto-colors").setup()
		end,
	},
	{
		"RRethy/vim-illuminate",
		event = "VeryLazy",
	},
	{
		"echasnovski/mini.surround",
		version = "*",
		config = true,
	},
}
