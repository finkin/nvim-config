require("mason").setup()

local lsp = require("config.lsp.handlers")

lsp.setup()

vim.lsp.config("*", {
	capabilities = lsp.capabilities,
	on_attach = lsp.on_attach,
})

vim.lsp.config("gopls", {
	root_markers = { "go.work", "go.mod", ".git" },
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
			schemas = require("schemastore").json.schemas(),
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
	"omnisharp",
	"ruff",
	"terraformls",
	"tflint",
	"yamlls",
	"zls",
	"jsonls",
})

require("config.lsp.lspsaga")
