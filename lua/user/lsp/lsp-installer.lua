local ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not ok then
  return
end

lsp_installer.setup {}
local lspconfig = require("lspconfig")

local opts = {
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
}

local sumneko_opts = require("user.lsp.settings.sumneko_lua")
opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
lspconfig.sumneko_lua.setup(opts)

local jsonls_opts = require("user.lsp.settings.jsonls")
opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
lspconfig.jsonls.setup(opts)

local pyright_opts = require("user.lsp.settings.pyright")
opts = vim.tbl_deep_extend("force", pyright_opts, opts)
lspconfig.pyright.setup(opts)

local terraformls_opts = require("user.lsp.settings.terraformls")
opts = vim.tbl_deep_extend("force", terraformls_opts, opts)
lspconfig.terraformls.setup(opts)

local yamlls_opts = require("user.lsp.settings.yamlls")
opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
lspconfig.yamlls.setup(opts)

local function on_attach()
  -- setup buffer keymaps
end

for _, server in ipairs { "gopls", "html", "marksman", "omnisharp", "tflint", "yamlls", "bashls", "dockerls"  } do
  lspconfig[server].setup { on_attach = on_attach }
end
