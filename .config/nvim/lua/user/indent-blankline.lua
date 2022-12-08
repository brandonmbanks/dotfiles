require('indent_blankline').setup{
    show_current_context = true,
    show_current_context_start = true,
    use_treesitter = true,
}

vim.cmd[[highlight IndentBlanklineChar guifg=#3B3F51 gui=nocombine]]
vim.cmd[[highlight IndentBlanklineContextChar guifg=#7E97AD gui=nocombine]]

