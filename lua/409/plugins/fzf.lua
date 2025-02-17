return {
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- or if using mini.icons/mini.nvim
		-- dependencies = { "echasnovski/mini.icons" },
		lazy = false,
		opts = {
			hls = {
				border = "FloatBorder",
				preview_border = "FloatBorder",
				header_text = "Function",
			},
			winopts = {
				border = "single",
				preview = {
					border = "single",
				},
			},
			fzf_opts = {
				["--layout"] = "reverse-list",
			},
		},
		keys = {
			{
				"<leader>ca",
				":FzfLua lsp_code_actions<CR>",
				desc = "Code actions (Preview)",
			},
		},
		config = function(_, opts)
			require("fzf-lua").setup(opts)
		end,
	},
}
