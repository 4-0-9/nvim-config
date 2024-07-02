return {
	{
		"tpope/vim-fugitive",
		keys = {
			{
				"<leader>gs",
				":tab Git<CR>",
				desc = "Fugitive",
			},
		},
		lazy = true,
	},
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		keys = {
			{
				"<leader>hp",
				":Gitsigns preview_hunk<CR>",
				desc = "Preview hunk",
			},
			{
				"<leader>hs",
				":Gitsigns stage_hunk<CR>",
				desc = "Stage hunk",
			},
			{
				"<leader>hu",
				":Gitsigns undo_stage_hunk<CR>",
				desc = "Undo stage hunk",
			},
			{
				"<leader>gb",
				":Gitsigns toggle_current_line_blame<CR>",
				desc = "Toggle current line blame",
			},
			{
				"[c",
				":Gitsigns next_hunk<CR>",
				desc = "Jump to next hunk",
			},
			{
				"]c",
				":Gitsigns prev_hunk<CR>",
				desc = "Jump to previous hunk",
			},
		},
		opts = {
			current_line_blame_opts = {
				delay = 1000,
			},
		},
		config = true,
	},
	{
		"sindrets/diffview.nvim",
		config = true,
	},
}
