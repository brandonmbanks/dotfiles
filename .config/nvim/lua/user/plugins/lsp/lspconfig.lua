return {
  'neovim/nvim-lspconfig',
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    { 'antosha417/nvim-lsp-file-operations', config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")

    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local opts = { noremap = true, silent = true }
    local on_attach = function(_, bufnr)
      opts.buffer = bufnr

      opts.desc = 'Go to definition'
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

      --vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts) -- telescope is handling this

      opts.desc = 'Show documentation for symbol'
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

      opts.desc = 'Test me'
      vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts)

      opts.desc = 'Open diagnostic'
      vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)

      opts.desc = 'Go to next diagnostic'
      vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts)

      opts.desc = 'Go to previous diagnostic'
      vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts)

      opts.desc = 'Show available code actions'
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, opts)

      --vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts) -- telescope is handling this

      opts.desc = 'Rename symbol'
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

      opts.desc = 'Show signature help'
      vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)

      opts.desc = 'Show type definition'
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- if server requires no addtional config add here
    local svrs = {'gopls', 'rust_analyzer', 'terraformls'}
    for _, name in ipairs(svrs) do
      lspconfig[name].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end

    -- configure lua server
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end
}
