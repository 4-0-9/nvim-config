local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

for i = 1, 9, 1 do
    vim.keymap.set("n", string.format("<leader>%s", i), function() harpoon:list():select(i) end)
end
