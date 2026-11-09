require("flexoki").setup({
  highlight_groups = {
    -- Keep Flexoki's palette, but give C# symbols clearer semantic roles.
    ["@keyword.c_sharp"] = { fg = "#BC5215" },
    ["@keyword.modifier.c_sharp"] = { fg = "#BC5215" },
    ["@type.c_sharp"] = { fg = "#4D6410" },
    ["@type.builtin.c_sharp"] = { fg = "#4D6410" },
    ["@function.c_sharp"] = { fg = "#205EA6" },
    ["@function.call.c_sharp"] = { fg = "#205EA6" },
    ["@function.method.c_sharp"] = { fg = "#205EA6" },
    ["@function.method.call.c_sharp"] = { fg = "#205EA6" },
    ["@property.c_sharp"] = { fg = "#24837B" },
    ["@variable.member.c_sharp"] = { fg = "#24837B" },
    ["@variable.c_sharp"] = { fg = "#100F0F" },
    ["@variable.parameter.c_sharp"] = { fg = "#100F0F" },
    ["@module.c_sharp"] = { fg = "#5E409D" },

    -- Roslyn semantic tokens take priority over Treesitter captures.
    ["@lsp.type.namespace.cs"] = { link = "@module.c_sharp" },
    ["@lsp.type.type.cs"] = { link = "@type.c_sharp" },
    ["@lsp.type.class.cs"] = { link = "@type.c_sharp" },
    ["@lsp.type.enum.cs"] = { link = "@type.c_sharp" },
    ["@lsp.type.interface.cs"] = { link = "@type.c_sharp" },
    ["@lsp.type.struct.cs"] = { link = "@type.c_sharp" },
    ["@lsp.type.typeParameter.cs"] = { link = "@type.c_sharp" },
    ["@lsp.type.function.cs"] = { link = "@function.c_sharp" },
    ["@lsp.type.method.cs"] = { link = "@function.method.c_sharp" },
    ["@lsp.type.property.cs"] = { link = "@property.c_sharp" },
    ["@lsp.type.event.cs"] = { link = "@property.c_sharp" },
    ["@lsp.type.field.cs"] = { link = "@variable.member.c_sharp" },
    ["@lsp.type.enumMember.cs"] = { link = "Constant" },
    ["@lsp.type.parameter.cs"] = { link = "@variable.parameter.c_sharp" },
    ["@lsp.type.variable.cs"] = { link = "@variable.c_sharp" },
    ["@lsp.type.keyword.cs"] = { link = "@keyword.c_sharp" },
    ["@lsp.type.modifier.cs"] = { link = "@keyword.modifier.c_sharp" },
  },
})
vim.cmd.colorscheme("flexoki-light")

require("snacks").setup({
  image = {
    formats = {
      "png",
      "jpg",
      "jpeg",
      "gif",
      "bmp",
      "webp",
      "tiff",
      "heic",
      "avif",
      "mp4",
      "mov",
      "avi",
      "mkv",
      "webm",
      "pdf",
      "icns",
      "svg",
      "svgz",
    },
  },
})

require("bufferline").setup({
  options = {
    offsets = { { filetype = "neo-tree", text = "", padding = 1 } },
  },
})

-- Statusline
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

vim.api.nvim_create_autocmd({ "LspAttach", "LspDetach" }, {
  group = vim.api.nvim_create_augroup("lualine_lsp_refresh", { clear = true }),
  callback = function()
    vim.schedule(function()
      lualine.refresh({ place = { "statusline" }, force = true })
    end)
  end,
})

-- Diagnostics list
require("trouble").setup({})
