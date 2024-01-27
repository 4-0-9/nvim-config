local trouble = require('trouble')

vim.keymap.set('n', '<leader>tt', ':TodoTrouble<CR>')
vim.keymap.set('n', '<leader>tv', function ()
    trouble.open()
end)
