local cmp = require('cmp')
local default_capabilities = require('cmp_nvim_lsp').default_capabilities()

local capabilities = vim.tbl_deep_extend(
    'force',
    {},
    vim.lsp.protocol.make_client_capabilities(),
    default_capabilities
)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'tsserver', 'rust_analyzer' },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup {
                capabilities = capabilities
            }
        end,
        ['lua_ls'] = function()
            local lspconfig = require('lspconfig')
            lspconfig.lua_ls.setup {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            }
        end
    }
})


require('lspconfig').yamlls.setup({
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = true
    end,
    settings = {
        yaml = {
            customTags = { '!enemy', '!delay', '!composite' },
            validate = false,
            format = {
                enable = true
            }
        }
    }
})

require('lspconfig').tsserver.setup {
    settings = {
        typescript = {
            preferences = {
                quoteStype = 'single'
            }
        },
        javascript = {
            preferences = {
                quoteStyle = 'single'
            }
        }
    }
}

local cmp_select = { behavior = cmp.SelectBehavior.Select }

local lspkind = require('lspkind')

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lua' },
        { name = 'luasnip',                keyword_length = 2 },
        { name = 'buffer',                 keyword_length = 3 },
    },
    view = {
        entries = 'native',
    },
    completion = {
        completeopt = 'menu,menuone,noinsert',
        docs_initially_visible = true
    },
    window = {
        documentation = cmp.config.window.bordered()
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            menu = ({
                buffer = '[Buffer]',
                nvim_lsp = '[LSP]',
                nvim_lua = '[Lua]',
                luasnip = '[LuaSnip]'
            })
        })
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Tab>'] = nil,
        ['<S-Tab>'] = nil
    }),
})


vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local bufnr = args.buf

        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
        vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
    end,
})

vim.diagnostic.config({
    virtual_text = true,
    update_in_insert = true,
    float = {
        focusable = false,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = ''
    }
})
