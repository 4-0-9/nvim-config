return {
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = true,
	},
	{
		"danymat/neogen",
		event = "VeryLazy",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			enabled = true,
			input_after_comment = true,
			languages = {
				cs = {
					template = {
						annotation_convention = "xmldoc",
					},
				},
			},
		},
		keys = {
			{
				"<leader>nf",
				":Neogen func<CR>",
				desc = "Document function",
			},
			{
				"<leader>nt",
				":Neogen type<CR>",
				desc = "Document type",
			},
			{
				"<leader>nc",
				":Neogen class<CR>",
				desc = "Document class",
			},
		},
	},
	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = true,
	},
}
