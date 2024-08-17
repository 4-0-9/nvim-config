return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{
			"<leader>of",
			":ObsidianQuickSwitch<CR>",
			"Find files (Obsidian)",
		},
		{
			"<leader>ot",
			":ObsidianTags<CR>",
			"Find tags (Obsidian)",
		},
		{
			"<leader>ol",
			":ObsidianLinks<CR>",
			"Find links (Obsidian)",
		},
		{
			"<leader>ow",
			":ObsidianWorkspace<CR>",
			"Find workspaces (Obsidian)",
		},
		{
			"gd",
			":ObsidianFollowLink<CR>",
			"Follow link (Obsidian)",
		},
	},
	opts = {
		preferred_link_style = "markdown",
		follow_url_func = function(url)
			vim.fn.jobstart({ "xdg-open", url })
		end,
		ui = {
			enable = false,
		},
		workspaces = {
			{
				name = "personal",
				path = "~/obsidian/409",
			},
		},
	},
}
