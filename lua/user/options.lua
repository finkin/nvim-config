-- :help options
local options = {
  -- line numbers
  number = true,                      -- show absolute line number on cursor line
  -- tabs & indentation
  expandtab = true,                   -- converts tabs to spaces (\x09 => \x20)
  tabstop = 2,                        -- how long a line starting with a tab will appear to be
  softtabstop = 2,                    -- how many spaces when pressing tab or backspace
  shiftwidth = 2,                     -- how long an indentation will go
  smartindent = true,                 -- smart indenting
  -- search
  incsearch = true,                   -- highlight the matched text pattern when searching
  hlsearch = true,                    -- higlight all matches on previous search 
  ignorecase = true,                  -- ignore case in search patterns
  smartcase = true,                   -- assumes case-sensitive only if you type mixed case in search
  -- undo
  backup = false,                     -- creates a backup file
  undofile = true,                    -- enable persistent undo
  -- scrolling
  scrolloff = 999,                    -- start scrolling xx lines from top or bottom
  splitbelow = true,                  -- force all horizontal splits to go below current window 
  splitright = true,                  -- force all vertical splits to go to the right of current window
  -- colors
  termguicolors = true,
  signcolumn = "yes",                 -- show line numbers and signs at the same time

  -- vim.opt.syntax on,
  hidden = true,                      -- navigate buffers without losing unsaved work
  mouse = "a",                        -- allow the mouse to be used in neovim
  showmode = false,                   -- hide mode as lightline is already showing it
  --vim.opt.gitsigns = true,
  clipboard = "unnamedplus",          -- allowws neovim to access the system clipboard
  cmdheight = 0,                      -- hide command line when it is not used 
  showtabline = 4,                    -- always show tabs
  wrap = false,                       -- don't wrap long lines
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd [[colorscheme dracula ]]
