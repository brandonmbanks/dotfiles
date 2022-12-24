require('nvim-tree').setup({
    -- currently crashing neovim
    --update_focused_file = {
    --    enable = true,
    --},
    view = {
        side = "left",
        mappings = {
            custom_only = false,
            list = {
                { key = 'u', action = 'dir_up' },
                { key = { 'l', '<CR>', 'o' }, action = 'edit' },
                { key = { 'h' }, action = 'close_node' },
                { key = { 'v' }, action = 'vsplit' },
            }
        }
    }
})

-- file explorer
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')
