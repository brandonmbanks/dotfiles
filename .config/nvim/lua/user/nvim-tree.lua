local ok, nvim_tree = pcall(require, 'nvim-tree')
if not ok then
    return
end

nvim_tree.setup({
    update_focused_file = {
        enable = true,
    },
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
