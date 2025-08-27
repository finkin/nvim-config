require("mason").setup()

local lspconfig = require("lspconfig")
lspconfig.bashls.setup({})
lspconfig.clangd.setup({})
lspconfig.dockerls.setup({})
lspconfig.gopls.setup({
  rootdir = require("lspconfig/util").root_pattern("go.work", "go.mod", ".git"),
})
lspconfig.html.setup({})
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {
          'vim',
          'require'
        },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
    },
  },
})
lspconfig.marksman.setup({})
lspconfig.omnisharp.setup({})
lspconfig.ruff.setup({})
lspconfig.terraformls.setup({
  cmd = { "terraform-ls", "serve" },
  filetypes = { "tf", "terraform", "hcl" },
})
lspconfig.tflint.setup({})
lspconfig.yamlls.setup({
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["https://json.schemastore.org/travis.json"] = ".travis.yml",
      },
    },
  },
})
lspconfig.zls.setup({})

local opts = {
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
}

local jsonls_opts = require("user.lsp.settings.jsonls")
opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
lspconfig.jsonls.setup(opts)

require("user.lsp.handlers").setup()
require("user.lsp.none-ls")
require("user.lsp.lspsaga")
