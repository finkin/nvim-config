require("mason").setup()
require("mason-lspconfig").setup()


local lspconfig = require("lspconfig")

local opts = {
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
}

local lua_ls_opts = require("user.lsp.settings.lua_ls")
opts = vim.tbl_deep_extend("force", lua_ls_opts, opts)
lspconfig.lua_ls.setup(opts)

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

for _, server in ipairs { "gopls", "html", "marksman", "omnisharp", "tflint", "bashls", "dockerls"  } do
  lspconfig[server].setup { on_attach = on_attach }
end


require("user.lsp.handlers").setup()
require("user.lsp.null-ls")
require("user.lsp.lspsaga")
require'lspconfig'.bashls.setup{}
