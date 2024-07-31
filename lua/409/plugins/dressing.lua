return {
	"stevearc/dressing.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		input = {
			enabled = true,
			border = "single",
		},
		select = {
			enabled = true,
			backend = { "builtin" },
            builtin = {
                show_numbers = true,
                border = "single"
            },
		},
	},
	config = function(_plugin, opts)
		require("dressing").setup(opts)
	end,
}
