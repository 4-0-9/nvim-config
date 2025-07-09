return {
	{
		"williamboman/mason.nvim",
		dependencies = {},
		opts = {
			PATH = "append",
			ui = {
				border = "single",
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			"vtsls",
			"eslint",
			"lua_ls",
			"jsonls",
			"html",
			"tailwindcss",
			"pylsp",
			"dockerls",
			"bashls",
			"marksman",
			"rust_analyzer",
		},
		dependencies = {
			{
				"mason-org/mason.nvim", opts = {}
			},
			"neovim/nvim-lspconfig",
		},
	}
}
