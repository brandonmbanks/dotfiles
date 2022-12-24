local telescope = require 'telescope'

telescope.setup {
    pickers = {
        find_files = {
            find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
        }
    }
}

require('telescope').setup {
    defaults = {
        preview = {
            treesitter = false
        }
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Leader>ff', builtin.find_files)
vim.keymap.set('n', '<Leader>p', builtin.find_files)
vim.keymap.set('n', '<Leader>fg', builtin.live_grep)
vim.keymap.set('n', '<Leader>fb', builtin.buffers)
vim.keymap.set('n', '<Leader>fh', builtin.help_tags)
vim.keymap.set('n', '<Leader>gb', builtin.git_branches)
vim.keymap.set('n', '<Leader>fs', builtin.lsp_document_symbols)
vim.keymap.set('n', 'gr', builtin.lsp_references)
vim.keymap.set('n', 'gi', builtin.lsp_implementations)
vim.keymap.set('n', '<Leader>fd', builtin.diagnostics)
