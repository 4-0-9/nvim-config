return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		lazy = false,
		keys = {
			{
				"<leader>m",
				function()
					require("render-markdown").toggle()
				end,
				"Toggle markdown rendering",
			},
		},
		opts = {
			enabled = true,
		},
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
	},
}
