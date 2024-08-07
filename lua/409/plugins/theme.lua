return {
	{
		"Mofiqul/dracula.nvim",
		name = "dracula",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("dracula")

			vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
			vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
			vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
		end,
	},
}
