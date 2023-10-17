return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    local mason = require('mason')
    local mason_lspconfig = require('mason-lspconfig')

    mason.setup({})

    mason_lspconfig.setup({
      ensure_installed = {
        'lua_ls',
        'rust_analyzer',
        'gopls',
        'terraformls',
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true,
    })
  end
}
