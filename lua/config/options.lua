-- :help options
local options = {
  number = true, -- absolute line number
  -- tabs & indentation
  expandtab = true, -- converts tabs to spaces (\x09 => \x20)
  tabstop = 2, -- how long a line starting with a tab will appear to be
  softtabstop = 2, -- how many spaces when pressing tab or backspace
  shiftwidth = 2, -- how long an indentation will go
  smartindent = true, -- smart indenting
  -- search
  ignorecase = true, -- ignore case in search patterns
  smartcase = true, -- assumes case-sensitive only if you type mixed case in search
  -- undo
  undofile = true, -- enable persistent undo
  -- scrolling
  scrolloff = 999, -- the page moves around the cursor
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  -- colors
  termguicolors = true,
  signcolumn = "yes", -- show line numbers and signs at the same time

  mouse = "a", -- allow the mouse to be used in neovim
  showmode = false, -- hide mode as lualine is already showing it
  clipboard = "unnamedplus", -- allowws neovim to access the system clipboard
  showtabline = 2, -- always show tabs
  updatetime = 300, -- make CursorHold-based feedback responsive
  wrap = false, -- don't wrap long lines
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

require("vim._core.ui2").enable({
  msg = {
    targets = {
      empty = "cmd",
      bufwrite = "msg",
      confirm = "cmd",
      emsg = "pager",
      echo = "msg",
      echomsg = "msg",
      echoerr = "pager",
      completion = "cmd",
      list_cmd = "pager",
      lua_error = "pager",
      lua_print = "msg",
      progress = "msg",
      rpc_error = "pager",
      quickfix = "msg",
      search_cmd = "cmd",
      search_count = "cmd",
      shell_cmd = "pager",
      shell_err = "pager",
      shell_out = "pager",
      shell_ret = "msg",
      undo = "msg",
      verbose = "pager",
      wildlist = "cmd",
      wmsg = "msg",
    },
    cmd = { height = 0.5 },
    dialog = { height = 0.5 },
    msg = { height = 0.3, timeout = 5000 },
    pager = { height = 0.5 },
  },
})
