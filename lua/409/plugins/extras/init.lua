return {
	{
		"akinsho/flutter-tools.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
		event = "VeryLazy",
		config = function()
			require("flutter-tools").setup({})
		end,
	},
	{
		"dmmulroy/tsc.nvim",
		config = function()
			require("tsc").setup()
		end,
	},
}
