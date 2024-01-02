require('409.remap')
require('409.set')

vim.api.nvim_create_autocmd({ 'FileType' }, {
    pattern = { '*.yaml' },
    command = 'setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>'
})
