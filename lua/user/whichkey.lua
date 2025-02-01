local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
}

which_key.add({
  { "<leader>F", "<cmd>lua require('telescope.builtin').live_grep({disable_coordinates = true})<cr>", desc = "Find in files" },
  { "<leader>b", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Buffers" },
  { "<leader>c", "<cmd>Bdelete!<CR>", desc = "Close Buffer" },
  { "<D-s>", "<cmd>Neotree toggle<cr>", desc = "Explorer" },
  { "<leader>f", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Find files" },
  { "<leader>g", group = "Git" },
  { "<leader>gb", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame" },
  { "<leader>gh", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
  { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git status" },
  { "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight" },
  { "<leader>l", group = "LSP" },
  { "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Go to declaration" },
  { "<leader>lI", "<cmd>LspInfo<cr>", desc = "Info" },
  { "<leader>lK", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "View signature" },
  { "<leader>lQ", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Diagnostics (Workspace)" },
  { "<leader>lR", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "View references" },
  { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
  { "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to defintion" },
  { "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Go to implementation" },
  { "<leader>lj", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic" },
  { "<leader>lk", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover info" },
  { "<leader>lq", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Diagnostics (Document)" },
  { "<leader>lr", "<cmd>Lspsaga lsp_finder<CR>", desc = "Lspsaga finder" },
  { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
  { "<leader>p", "<cmd>Telescope project<cr>", desc = "Projects" },
  { "<leader>q", "<cmd>q!<CR>", desc = "Quit" },
  { "<leader>r", group = "Refactor" },
  { "<leader>ra", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
  { "<leader>rf", "<cmd>lua vim.lsp.buf.format{async=true}<cr>", desc = "Format" },
  { "<leader>rl", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
  { "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
  { "<leader>s", group = "Search" },
  { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
  { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
  { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
  { "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
  { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
  { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
  { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
  { "<leader>w", "<cmd>w!<CR>", desc = "Save" },
})

which_key.setup(setup)
