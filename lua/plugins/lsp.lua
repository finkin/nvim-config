-- Language server tools
require("mason").setup()

local lsp = require("plugins.lsp.handlers")

lsp.setup()

vim.lsp.config("*", {
  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
})

vim.lsp.enable({
  "bashls",
  "clangd",
  "dockerls",
  "gopls",
  "html",
  "lua_ls",
  "marksman",
  "roslyn_ls",
  "ruff",
  "terraformls",
  "tflint",
  "yamlls",
  "zls",
  "jsonls",
})
