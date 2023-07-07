local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.set_preferences({
    set_lsp_keymaps = false,
})

lsp.ensure_installed({
    'lua_ls',
    'rust_analyzer',
    'gopls',
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

local cmp = require('cmp')
-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'cmdline' }
    })
})

lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    --vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts) -- telescope is handling this
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    --vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts) -- telescope is handling this
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
end)

lsp.setup()

-- autoformat on save
vim.api.nvim_create_autocmd('BufWritePre', {
    callback = function()
        vim.lsp.buf.format()
    end
})

-- <C-x><C-o> triggers language aware completion
-- <C-y> accepts suggestion

vim.api.nvim_create_autocmd('CompleteDone', {
    pattern = '*',
    command = 'pclose',
})
