return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			"nvim-telescope/telescope.nvim", -- optional
		},
        keys = {
            {
                "<leader>gs",
                ":Neogit<CR>",
                desc = "Neogit"
            },
        },
        opts = {
            signs = {
                item = { ">", "v" },
                section = { ">", "v" },
            },
            mappings = {
                status = {
                    ["="] = "Toggle",
                    ["<tab>"] = false,
                },
            },
        },
		config = true,
	},
	{
		"echasnovski/mini.diff",
		version = false,
		config = true,
	},
}
