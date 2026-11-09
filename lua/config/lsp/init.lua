local lsp = require("config.lsp.handlers")

lsp.setup()

vim.lsp.config("*", {
  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
})

vim.lsp.config("gopls", {
  root_markers = { "go.work", "go.mod", ".git" },
})

vim.lsp.config("roslyn_ls", {
  root_dir = function(bufnr, on_dir)
    local project_root = vim.fs.root(bufnr, function(name)
      return name:match("%.csproj$") ~= nil
    end)

    if project_root then
      on_dir(project_root)
      return
    end

    local solution_root = vim.fs.root(bufnr, function(name)
      return name:match("%.slnx?$") ~= nil
    end)

    if solution_root then
      on_dir(solution_root)
    end
  end,
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = {
          "vim",
          "require",
        },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
    },
  },
})

vim.lsp.config("terraformls", {
  cmd = { "terraform-ls", "serve" },
  filetypes = { "tf", "terraform", "hcl" },
})

vim.lsp.config("yamlls", {
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["https://json.schemastore.org/travis.json"] = ".travis.yml",
      },
    },
  },
})

vim.lsp.config("jsonls", {
  settings = {
    json = {
      schemas = vim.list_extend({
        {
          description = "Claude Code settings",
          fileMatch = {
            ".claude/settings.json",
            ".claude/settings.local.json",
            "/.claude/settings.json",
            "/.claude/settings.local.json",
          },
          url = "https://json.schemastore.org/claude-code-settings.json",
        },
      }, require("schemastore").json.schemas()),
      validate = { enable = true },
    },
  },
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
