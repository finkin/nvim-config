local treesitter = require("nvim-treesitter")

treesitter.setup()

local ensure_installed = {
  "lua",
  "markdown",
  "markdown_inline",
  "bash",
  "python",
  "regex",
  "go",
  "hcl",
  "terraform",
  "vim",
}

local installed = treesitter.get_installed()
local parsers_to_install = vim
  .iter(ensure_installed)
  :filter(function(parser)
    return not vim.tbl_contains(installed, parser)
  end)
  :totable()

if #parsers_to_install > 0 then
  treesitter.install(parsers_to_install)
end

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)

    if lang and vim.tbl_contains(ensure_installed, lang) then
      pcall(vim.treesitter.start, args.buf, lang)
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
