return {
	{
		"tpope/vim-fugitive",
		keys = {
			{
				"<leader>gs",
				vim.cmd.Git,
				mode = "n",
				desc = "Open Fugitive",
			},
		},
	},
	{
		"echasnovski/mini.diff",
		version = false,
		config = true
	},
}
