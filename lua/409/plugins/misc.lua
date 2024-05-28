return {
	{
		"echasnovski/mini.indentscope",
		version = "*",
		opts = {
			draw = {
				delay = 0,
				animation = function()
					return 0
				end,
			},
			symbol = "│",
            options = {
                indent_at_cursor = false,
                try_as_border = true,
            },
		},
		config = function(plugin, opts)
			require("mini.indentscope").setup(opts)
		end,
	},
}
