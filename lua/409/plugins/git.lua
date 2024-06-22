return {
	{
		"tpope/vim-fugitive",
        keys = {
            {
                "<leader>gs",
                ":Git<CR>",
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
}
