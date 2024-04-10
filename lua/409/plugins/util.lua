return {
	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	{
		"mbbill/undotree",
		keys = {
			{
				"<leader>u",
				":UndotreeToggle<CR>",
			},
		},
	},
	"nvim-tree/nvim-web-devicons",
	{
		"RRethy/vim-illuminate",
		event = "VeryLazy",
	},
	{
        "echasnovski/mini.surround",
        version = "*",
        config = function()
            require("mini.surround").setup()
        end
    },
}
