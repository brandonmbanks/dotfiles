-- :help options
local options = {
    backup = false,             -- disables backup file when writing a file
    swapfile = false,           -- disables swap file
    undofile = true,            -- enables persistent undo by saving undo history
    --spell = true,               -- enables vim spellchecker
    --spelllang='en_us',          -- sets language to us English
    timeoutlen = 1000,          -- max time to wait for mapped sequence to complete
    clipboard = "unnamedplus",  -- allows nvim to access system clipboard
    cmdheight = 1,              -- cmd line height
    pumheight = 10,             -- pop up menu height
    signcolumn = "yes",         -- always display signcolumn to not move text
    showmode = false,           -- disable vim mode like -- INSERT --
    splitbelow = true,          -- splits dont move current window
    splitright = true,          -- vsplits dont move current window
    titlestring = '%t',         -- sets title to current file
    title = true,               -- enables title
    -- line numbers
    number = true,              -- display line numbers
    relativenumber = true,      -- display relative line numbers
    cursorline = true,          -- highlights the cursor line
    cursorcolumn = true,        -- highlights the cursor column
    mouse = 'a',                -- adds mouse support, i.e. clicking moves the cursor
    scrolloff = 8,              -- minimum number of lines to keep above and below cursor
    sidescrolloff = 8,          -- number number of columns to keep right and left of cursor
    confirm = true,             -- confirm saving changes when quitting a file without saving
    fileencoding = "utf-8",
    wrap = false,               -- displays lines as one long line
    tabstop = 4,                -- number of spaces that a tab in a file counts for
    softtabstop = 4,            -- number of spaces inserted for a tab while editing
    shiftwidth = 4,             -- number of spaces to use for each step of indent
    expandtab = true,           -- converts tabs to spaces
    smartindent = true,         -- smart indent when starting a new line
    -- searching
    hlsearch = true,            -- highlight previous search pattern
    incsearch = true,           -- show where the search pattern matches as its typed
    ignorecase = true,          -- ignores case in search pattern
    smartcase = true,           -- overrides ignorecase if search pattern contains upper case
    termguicolors = true,

    completeopt = "menu,menuone,noselect",                      -- autocomplete options
    guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20",    -- default cursor setttings
    guifont = "monospace:h17",                                  -- font to use in gui apps
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

