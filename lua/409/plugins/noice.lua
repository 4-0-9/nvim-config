return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {},
	config = function()
		require("noice").setup({
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
				hover = {
					silent = true,
				},
			},
			presets = {
				bottom_search = true,
				inc_rename = false,
				lsp_doc_border = true,
			},
			cmdline = {
				enabled = true,
				view = "cmdline",
			},
			messages = {
				enabled = false,
			},
			views = {
				hover = {
					border = {
						style = "single",
					},
				},
				mini = {
					win_options = {
						winblend = 0,
					},
				},
                cmdline_popup = {
                    border = {
                        style = "none"
                    },
                },
                popup = {
                    border = {
                        style = "single",
                    },
                },
                confirm = {
                    backend = "popup",
                    border = {
                        style = "single",
                    },
                },
			},
		})
	end,
}
