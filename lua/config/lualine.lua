local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn", "info", "hint" },
  symbols = { error = " ", warn = " ", info = " ", hint = " " },
  colored = true,
  update_in_insert = true,
}

local lsp = {
  function()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if next(clients) == nil then
      return "(no lsp)"
    end

    local names = {}
    for _, client in ipairs(clients) do
      names[client.name] = true
    end

    return "(" .. table.concat(vim.tbl_keys(names), ",") .. ")"
  end,
}

lualine.setup({
  options = {
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "neo-tree", "Outline" },
    globalstatus = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { { "branch", icon = "" }, { "diff", colored = false } },
    lualine_c = { diagnostics },
    lualine_x = { "searchcount", "filetype", lsp },
    lualine_y = { "encoding", "fileformat", "filesize" },
    lualine_z = { "%p%%/%L" },
  },
})
