local opts = { noremap = true, silent = true }

local function map(mode, shortcut, cmd, o)
    o = opts or {}
    o.buffer = bufnr
    vim.keymap.set(mode, shortcut, cmd, opts)
end

-- remap space as leader key
map('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

map('n', '<Leader>sv', '<cmd>lua ReloadConfig()<CR>')

-- replace
map('n', '<Leader>R', ':%s//gI<Left><Left><Left>')

-- Modes
--  normal_mode = 'n'
--  insert_mode = 'i'
--  visual_mode = 'v'
--  visual_block_mode = 'x'
--  term_mod = 't'
--  command_mode = 'c'

-- Normal --
-- better window navigation
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- telescope
local builtin = require('telescope.builtin')
map('n', '<Leader>ff', builtin.find_files)
map('n', '<Leader>p', builtin.find_files)
map('n', '<Leader>fg', builtin.live_grep)
map('n', '<Leader>fb', builtin.buffers)
map('n', '<Leader>fh', builtin.help_tags)
map('n', '<Leader>gb', builtin.git_branches)
map('n', '<Leader>fs', builtin.lsp_document_symbols)
map('n', 'gr', builtin.lsp_references)
map('n', 'gi', builtin.lsp_implementations)
map('n', '<Leader>fd', builtin.diagnostics)

-- file explorer
map('n', '<Leader>e', ':NvimTreeToggle<CR>', opts)

-- terminal
map('t', '<Esc>', '<C-\\><C-N>') -- exit terminal mode
map('n', '<Leader>t', ':vsplit |term<CR>i')

-- resize windows with arrows
map('n', '<A-Up>', ':resize +2<CR>', opts)
map('n', '<A-Down>', ':resize -2<CR>', opts)
map('n', '<A-Left>', ':vertical resize -2<CR>', opts)
map('n', '<A-Right>', ':vertical resize +2<CR>', opts)

-- Insert --
-- quick exit to normal mode
map('i', 'jj', '<Esc>', opts)
map('i', 'jk', '<Esc>', opts)
map('i', 'kk', '<Esc>', opts)

-- Visual
-- move text
map('v', '<A-j>', ':m .+1<CR>==', opts)
map('v', '<A-k>', ':m .-2<CR>==', opts)

-- dont copy when pasting over word
map('v', 'p', '"_dP', opts)

-- stay in indent mode
map('v', '>', '>gv', opts)
map('v', '<', '<gv', opts)

-- trouble
map('n', '<Leader>xx', '<Cmd>TroubleToggle<CR>', opts)
map('n', '<Leader>xw', '<Cmd>TroubleToggle workspace_diagnostics<CR>', opts)
map('n', '<Leader>xd', '<Cmd>TroubleToggle document_diagnostics<CR>', opts)
map('n', '<Leader>xl', '<Cmd>TroubleToggle loclist<CR>', opts)
map('n', '<Leader>xq', '<Cmd>TroubleToggle quickfix<CR>', opts)
map('n', 'gR', '<cmd>TroubleToggle lsp_references<CR>', opts)

-- pass whole file to indentation tool
-- gg=G''
