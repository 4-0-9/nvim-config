return {
	{
		"Mofiqul/dracula.nvim",
		name = "dracula",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("dracula")

			vim.api.nvim_set_hl(0, "QuickFixLine", { link = "Visual" })
			vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#44475a" })
			vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#44475a" })
			vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#44475a" })
			vim.api.nvim_set_hl(0, "TelescopePromptCounter", { fg = "#44475a" })
			vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#44475a" })
			vim.api.nvim_set_hl(0, "PmenuSel", { fg = "#282a36", bg = "#50fa7b", bold = true })

			vim.api.nvim_set_hl(0, "TabLine", { fg = "#f8f8f2", bg = "#44475a" })
			vim.api.nvim_set_hl(0, "TabLineSel", { fg = "#282a36", bg = "#50fa7b", bold = true })
			vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#50fa7b" })
			vim.api.nvim_set_hl(0, "DashboardShortCut", { fg = "#bd93f9" })
		end,
	},
}
