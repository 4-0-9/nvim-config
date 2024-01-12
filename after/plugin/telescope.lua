local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
    local status, result = pcall(function() return vim.fn.input("Grep > ") end)
    --
    -- prevent keyboard interrupt error
    if not status then
        return
    end

    builtin.grep_string({ search = result });
end)
vim.api.nvim_set_hl(0, "TelescopeSelection", { link = "Visual" })
