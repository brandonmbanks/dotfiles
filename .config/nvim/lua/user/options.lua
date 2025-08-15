-- :help options
vim.opt.title = true
vim.opt.titlestring = "%t" -- sets title to current file
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.opt.scrollbind = false

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus" -- utilize clipboard

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

-- splits dont move current window
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.updatetime = 50
