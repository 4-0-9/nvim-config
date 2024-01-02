function Color(color)
    color = color or "catppuccin-mocha"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
    -- If Vim thinks StatusLine and StatusLineNC are the same it overrides these settings
    vim.api.nvim_set_hl(0, "StatusLineNC", { ctermbg = "#ff0000", bg = "none" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "none", bg = "none" })
end

Color()
-- #1E1E2E
