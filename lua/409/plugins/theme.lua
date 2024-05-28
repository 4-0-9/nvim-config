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
        end
    },
}
