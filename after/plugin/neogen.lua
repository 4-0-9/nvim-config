local neogen = require('neogen')

neogen.setup({
    enabled = true,             --if you want to disable Neogen
    input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
    languages = {
        cs = {
            template = {
                annotation_convention = 'xmldoc'
            }
        }
    }
})

vim.keymap.set('n', '<leader>nf', function()
    neogen.generate({ type = 'func' })
end)

vim.keymap.set('n', '<leader>nt', function()
    neogen.generate({ type = 'type' })
end)

vim.keymap.set('n', '<leader>nc', function()
    neogen.generate({ type = 'class' })
end)

vim.keymap.set('i', '<C-k>', function()
    neogen.jump_next()
end)

vim.keymap.set('i', '<C-j>', function()
    neogen.jump_prev()
end)
