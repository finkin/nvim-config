local function map(mode, keys, command, description)
  vim.keymap.set(mode, keys, command, { silent = true, desc = description })
end

-- Remap space as leader key
map("", "<Space>", "<Nop>", "")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

---(MODE,  KEY,   COMMAND,   DESCRIPTION)
-- Navigation
-- Splits
map("n", "<C-h>", "<C-w>h", "Move to split in the left")
map("n", "<C-j>", "<C-w>j", "Move to split below")
map("n", "<C-k>", "<C-w>k", "Move to split above")
map("n", "<C-l>", "<C-w>l", "Move to split in the right")
-- Buffers
map("n", "<S-l>", ":bnext<CR>", "Move to next buffer")
map("n", "<S-h>", ":bprevious<CR>", "Move to previous buffer")
map("n", "<leader>c", ":Bdelete!<CR>", "Close Buffer")
-- Tree
map("n", "<D-s>", ":Neotree toggle<cr>","Toggle Tree")

-- Search
map("n", "<leader>h", ":nohlsearch<CR>", "Clear search highlights")
map("n", "<leader>f", ":lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", "Find files")
map("n", "<leader>F", ":lua require('telescope.builtin').live_grep({disable_coordinates = true})<cr>", "Find in files")
map("n", "<leader>b", ":lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", "Buffers")
map("n", "<leader>R", ":Telescope oldfiles<cr>", "Open Recent File")
-- Indent
-- < and > normally change indentation but deselect text;
-- this remaps them to keep the selection after indenting.
map("v", ">", ">gv","")
map("v", "<", "<gv", "")

-- Move text up and down
map("v", "<S-j>", ":m .+1<CR>==gv", "Move selected line down")
map("v", "<S-k>", ":m .-2<CR>==gv", "Move selected line up")
-- By default, pasting (p) in visual mode replaces selected
-- text and overwrites the register. This remap makes p paste
-- from the default register but keeps the yanked text unchanged
-- by using the black-hole register ("_).
map("v", "p", '"_dp', "")

-- Git
map("n", "<leader>gb", ":lua require 'gitsigns'.blame_line()<cr>", "Git Blame")
map("n", "<leader>gl", ":Telescope git_commits<cr>", "Git log")
map("n", "<leader>gs", ":Telescope git_status<cr>", "Git status")
-- LSP
map("n", "<leader>lD", ":lua vim.lsp.buf.declaration()<CR>", "Go to declaration")
map("n", "<leader>lI", ":LspInfo<cr>", "Info")
map("n", "<leader>lK", ":lua vim.lsp.buf.signature_help()<CR>", "View signature")
map("n", "<leader>lQ", ":Trouble diagnostics toggle<cr>", "Diagnostics")
map("n", "<leader>lR", ":lua vim.lsp.buf.references()<CR>", "View references")
map("n", "<leader>lS", ":Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols")
map("n", "<leader>ld", ":lua vim.lsp.buf.definition()<CR>", "Go to defintion")
map("n", "<leader>li", ":lua vim.lsp.buf.implementation()<CR>", "Go to implementation")
map("n", "<leader>lj", ":lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic")
map("n", "<leader>lk", ":lua vim.lsp.buf.hover()<CR>", "Hover info")
map("n", "<leader>lq", ":Trouble diagnostics toggle filter.buf=0<cr>", "Diagnostics (Buffer)")
map("n", "<leader>lr", ":Lspsaga lsp_finder<CR>", "Lspsaga finder")
map("n", "<leader>ls", ":Telescope lsp_document_symbols<cr>", "Document Symbols")
map("n", "<leader>p", ":Telescope project<cr>", "Projects")
-- Refactoring
map("n", "<leader>ra", ":lua vim.lsp.buf.code_action()<cr>", "Code Action")
map("n", "<leader>rf", ":lua vim.lsp.buf.format{async=true}<cr>", "Format")
map("n", "<leader>rl", ":lua vim.lsp.codelens.run()<cr>", "CodeLens Action")
map("n", "<leader>rr", ":lua vim.lsp.buf.rename()<cr>", "Rename")
-- AI
map("n", "<leader>a", ":CodeCompanionChat Toggle<CR>", "AI Chat")

map("n", "<leader>w", ":w!<CR>", "Save")
map("n", "<leader>q", ":q!<CR>", "Quit")
