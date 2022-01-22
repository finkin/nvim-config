-- :help options

local options = {
    backup = false,                     -- creates a backup file
    number = true,                      -- set numbered lines
    relativenumber = true,              -- set relative numbered lines
    numberwidth = 4,                    -- set number column width to 2 (default 4)
    incsearch = true,                   -- highlight the matched text pattern when searching
    hlsearch = true,                    -- higlight all matches on previous search 
    shiftwidth = 4,
    tabstop = 4,                        -- insert 4 spaces for tab
    softtabstop = 4,
    expandtab = true,                   -- converts tabs to spaces
    scrolloff=999,                      -- start scrolling xx lines from top or bottom
    smartindent = true,                 -- smart indenting
    splitbelow = true,                  -- force all horizontal splits to go below current window 
    splitright = true,                  -- force all vertical splits to go to the right of current window
    termguicolors = true,
    -- vim.opt.syntax on,
    hidden = true,                      -- navigate buffers without losing unsaved work
    undofile = true,                    -- enable persistent undo
    mouse = "a",                        -- allow the mouse to be used in neovim
    ignorecase = true,                  -- ignore case in search patterns
    smartcase = true,                   -- smart case
    showmode = false,                   -- hide mode as lightline is already showing it
    --vim.opt.gitsigns = true,
    clipboard = "unnamedplus",          -- allowws neovim to access the system clipboard
    signcolumn = "number",
    cmdheight = 2,                      -- more space in the neovim command line for displaying messages
    showtabline = 4,                    -- always show tabs
    cursorline = true,                  -- highlight the current line
    wrap = false,                       -- don't wrap long lines
}

for k, v in pairs(options) do
    vim.opt[k] = v
end


