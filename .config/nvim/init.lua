-- there are some performance issues with nvim tree
-- issue: https://github.com/nvim-tree/nvim-tree.lua/issues/1844
-- disable netrw. using nvim tree instead
--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1

vim.keymap.set('n', '<leader>e', ':Ex<cr>')

require('user')
