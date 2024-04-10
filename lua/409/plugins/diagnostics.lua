return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{
				"<leader>tt",
				":TodoTrouble<CR>",
				desc = "Trouble (TODOs)",
			},
			{
				"<leader>tv",
				":Trouble<CR>",
                desc = "Trouble",
			},
		},
	},
}
