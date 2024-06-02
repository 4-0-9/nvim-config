return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme('catppuccin-mocha')

            local catppuccin_colors = require('catppuccin.palettes').get_palette('mocha')

            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            vim.api.nvim_set_hl(0, "FloatBorder", { fg = catppuccin_colors.surface2 })
            vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
            -- If Vim thinks StatusLine and StatusLineNC are the same it overrides these settings
            vim.api.nvim_set_hl(0, "StatusLineNC", { ctermbg = 0, bg = "none" })
            vim.api.nvim_set_hl(0, "CursorLine", { link = "Visual" })
            vim.api.nvim_set_hl(0, "Pmenu", { link = "Normal" })
            vim.api.nvim_set_hl(0, "PmenuSel", { link = "Visual" })
            vim.api.nvim_set_hl(0, "PmenuSbar", { link = "Normal" })
            vim.api.nvim_set_hl(0, "CmpPmenuBorder", { fg = catppuccin_colors.surface2 })
            vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = catppuccin_colors.surface2 })

            vim.api.nvim_set_hl(0, "NeogitHunkHeaderCursor", { fg = catppuccin_colors.blue, bg = "none", bold = true })
            vim.api.nvim_set_hl(0, "NeogitHunkHeader", { fg = catppuccin_colors.blue, bg = "none", bold = true })
            vim.api.nvim_set_hl(0, "NeogitHunkHeaderHighlight", { link = "NeogitHunkHeader" })
            vim.api.nvim_set_hl(0, "NeogitDiffAddHighlight", { fg = catppuccin_colors.green, bg = "none" })
            vim.api.nvim_set_hl(0, "NeogitDiffDeleteHighlight", { fg = catppuccin_colors.red, bg = "none" })
            vim.api.nvim_set_hl(0, "NeogitDiffContextHighlight", { link = "Normal" })
            vim.api.nvim_set_hl(0, "NeogitDiffContextCursor", { link = "Normal" })
            vim.api.nvim_set_hl(0, "NeogitDiffAddCursor", { link = "NeogitDiffAddHighlight" })
            vim.api.nvim_set_hl(0, "NeogitDiffDeleteCursor", { link = "NeogitDiffDeleteHighlight" })

            vim.api.nvim_set_hl(0, "NeogitDiffHeader", { fg = catppuccin_colors.blue, bg = "none", bold = true })
            vim.api.nvim_set_hl(0, "NeogitDiffAdd", { link = "NeogitDiffAddHighlight" })
            vim.api.nvim_set_hl(0, "NeogitDiffDelete", { link = "NeogitDiffDeleteHighlight" })
            vim.api.nvim_set_hl(0, "NeogitDiffContext", { link = "NeogitDiffContextHighlight" })

            vim.api.nvim_set_hl(0, "NeogitCommitViewHeader", { fg = catppuccin_colors.blue, bg = "none", bold = true })
        end
    },
}
