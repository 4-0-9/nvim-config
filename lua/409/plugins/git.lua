return {
	{
		"tpope/vim-fugitive",
        keys = {
            {
                "<leader>gs",
                ":tab Git<CR>",
                desc = "Fugitive"
            },
        },
        lazy = true,
	},
	{
		"echasnovski/mini.diff",
		version = false,
		config = true,
	},
    {
        "sindrets/diffview.nvim",
        config = true,
    },
}
