local function map(mode, keys, command, description)
  vim.keymap.set(mode, keys, command, { silent = true, desc = description })
end

local function incoming_calls()
  local params = vim.lsp.util.make_position_params(0, "utf-8")

  vim.lsp.buf_request(0, "textDocument/prepareCallHierarchy", params, function(err, result)
    if err then
      vim.notify(err.message or "LSP incoming calls failed", vim.log.levels.ERROR)
      return
    end

    if not result or vim.tbl_isempty(result) then
      vim.notify("No call hierarchy available", vim.log.levels.INFO)
      return
    end

    local item = result[1]
    vim.lsp.buf_request(0, "callHierarchy/incomingCalls", { item = item }, function(call_err, calls)
      if call_err then
        vim.notify(call_err.message or "LSP incoming calls failed", vim.log.levels.ERROR)
        return
      end

      if not calls or vim.tbl_isempty(calls) then
        vim.notify("No incoming calls", vim.log.levels.INFO)
        return
      end

      vim.lsp.util.show_document({
        uri = item.uri,
        range = item.selectionRange,
      }, "utf-8", { focus = true })

      local items = vim.lsp.util.locations_to_items(
        vim.tbl_map(function(call)
          return {
            uri = call.from.uri,
            range = call.from.selectionRange,
          }
        end, calls),
        "utf-8"
      )

      vim.fn.setloclist(0, {}, " ", {
        title = "Incoming Calls",
        items = items,
      })
      vim.cmd("lopen")
    end)
  end)
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
map("n", "<C-S-j>", ":split<CR>", "Create horizontal split")
map("n", "<C-S-l>", ":vsplit<CR>", "Create vertical split")
-- Buffers
map("n", "<S-l>", ":bnext<CR>", "Move to next buffer")
map("n", "<S-h>", ":bprevious<CR>", "Move to previous buffer")
map("n", "<leader>c", ":Bdelete!<CR>", "Close Buffer")
-- Tree
map("n", "<D-s>", ":Neotree toggle<cr>", "Toggle Tree")

-- Search
map("n", "<leader>h", ":nohlsearch<CR>", "Clear search highlights")
map(
  "n",
  "<leader>f",
  ":lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
  "Find files"
)
map("n", "<leader>F", ":lua require('telescope.builtin').live_grep({disable_coordinates = true})<cr>", "Find in files")
map(
  "n",
  "<leader>b",
  ":lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
  "Buffers"
)
map("n", "<leader>R", ":Telescope oldfiles<cr>", "Open Recent File")
-- Indent
-- < and > normally change indentation but deselect text;
-- this remaps them to keep the selection after indenting.
map("v", ">", ">gv", "")
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
map("n", "<leader>lI", ":checkhealth vim.lsp<cr>", "LSP health")
map("n", "<leader>lK", ":lua vim.lsp.buf.signature_help()<CR>", "View signature")
map("n", "<leader>lQ", ":Trouble diagnostics toggle<cr>", "Diagnostics")
map("n", "<leader>lS", ":Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols")
map("n", "<leader>ld", ":lua vim.lsp.buf.definition()<CR>", "Go to defintion")
map("n", "<leader>li", ":lua vim.lsp.buf.implementation()<CR>", "Go to implementation")
map("n", "<leader>lj", ":lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic")
map("n", "<leader>lk", ":lua vim.lsp.buf.hover()<CR>", "Hover info")
map("n", "<leader>lc", incoming_calls, "Incoming calls")
map("n", "<leader>lq", ":Trouble diagnostics toggle filter.buf=0<cr>", "Diagnostics (Buffer)")
map("n", "<leader>lr", ":lua vim.lsp.buf.references()<CR>", "View references")
map("n", "<leader>ls", ":Telescope lsp_document_symbols<cr>", "Document Symbols")
map("n", "<leader>lt", ":lua vim.lsp.buf.type_definition()<CR>", "Go to type definition")
map("n", "<leader>p", ":Telescope project<cr>", "Projects")
-- Refactoring
map("n", "<leader>ra", ":lua vim.lsp.buf.code_action()<cr>", "Code Action")
map("n", "<leader>rf", ":lua vim.lsp.buf.format{async=true}<cr>", "Format")
map("n", "<leader>rl", ":lua vim.lsp.codelens.run()<cr>", "CodeLens Action")
map("n", "<leader>rr", ":lua vim.lsp.buf.rename()<cr>", "Rename")
map("n", "<leader>w", ":w!<CR>", "Save")
map("n", "<leader>q", ":q!<CR>", "Quit")
