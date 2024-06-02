return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{
				"<leader>tt",
				":TodoTrouble toggle<CR>",
				desc = "Trouble (TODOs)",
			},
			{
				"<leader>tv",
				":Trouble diagnostics toggle<CR>",
                desc = "Trouble diagnostics (toggle)",
			},
		},
        opts = {},
	},
}
