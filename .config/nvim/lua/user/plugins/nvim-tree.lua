local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- mappings = {
  --     custom_only = false,
  --     list = {
  --         { key = 'u', action = 'dir_up' },
  --         { key = { 'l', '<CR>', 'o' }, action = 'edit' },
  --         { key = { 'h' }, action = 'close_node' },
  --         { key = { 'v' }, action = 'vsplit' },
  --     },
  -- },

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set("n", "l", api.node.open.edit, opts("open"))
end

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local nvim_tree = require("nvim-tree")

    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvim_tree.setup({
      update_focused_file = {
        enable = true,
      },
      on_attach = my_on_attach,
    })

    -- file explorer
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
  end,
}
