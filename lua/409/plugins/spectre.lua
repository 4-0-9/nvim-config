return {
	{
		"nvim-pack/nvim-spectre",
		lazy = true,
		keys = {
			{
				"<leader>S",
				function ()
					require('spectre').toggle()
				end,
				"Toggle Spectre"
			},
		},
		config = true,
	},
}
