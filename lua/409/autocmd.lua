vim.api.nvim_create_autocmd({ 'FileType' }, {
    pattern = { '*.yaml' },
    command = 'setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:>'
})

vim.api.nvim_create_autocmd({ 'FileType' }, {
    pattern = { 'netrw' },
    command = 'nnoremap <buffer> <C-l> <Cmd> TmuxNavigateRight<CR>'
})