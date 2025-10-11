-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Themes
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	{ "catppuccin/nvim", as = "catppuccin", lazy = true },

	"nvim-lua/popup.nvim", -- Implementation of the Popup API from vim
	"nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
	"windwp/nvim-autopairs", -- Autopair, integrates with cmp ans treesitter
	"numToStr/Comment.nvim", -- Easyliy comment stuff

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			--[[ {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information ]]
		},
	},
	{
		"akinsho/bufferline.nvim",
		opts = {
			options = {
				offsets = { { filetype = "neo-tree", text = "", padding = 1 } },
			},
		},
	},
	"moll/vim-bbye",
	"nvim-lualine/lualine.nvim",
	"tpope/vim-surround",

	-- Completion
	"hrsh7th/nvim-cmp", -- Completion plugin
	"hrsh7th/cmp-buffer", -- buffer completion
	"hrsh7th/cmp-path", -- path completion
	"hrsh7th/cmp-cmdline", -- cmdline completion
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-nvim-lsp-signature-help",

	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	{
		"L3MON4D3/LuaSnip", -- snippet engine
		build = "make install_jsregexp",
	},
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets", -- a bunch of snippets

	-- LSP
	"neovim/nvim-lspconfig", -- enable LSP
	"arkav/lualine-lsp-progress",
	"glepnir/lspsaga.nvim",
	"folke/trouble.nvim",

	-- Formatter
	{ "stevearc/conform.nvim" },

	-- Linters without LSP
	"mfussenegger/nvim-lint",

	-- AI
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{
		"ravitemer/mcphub.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
		},
		-- comment the following line to ensure hub will be ready at the earliest
		cmd = "MCPHub", -- lazy load by default
		build = "npm install -g mcp-hub@latest", -- Installs required mcp-hub npm modulemapl
		-- uncomment this if you don't want mcp-hub to be available globally or can't use -g
		-- build = "bundled_build.lua",  -- Use this and set use_bundled_binary = true in opts  (see Advanced configuration)
		config = function()
			require("mcphub").setup()
		end,
	},
	-- Command line
	{
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},

	-- Telescope
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-media-files.nvim",
	"nvim-telescope/telescope-project.nvim",
	"nvim-telescope/telescope-ui-select.nvim",

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"JoosepAlviste/nvim-ts-context-commentstring",
	"fladson/vim-kitty",

	-- Git
	"lewis6991/gitsigns.nvim",

	{ "folke/which-key.nvim", lazy = true },
	-- use "dstein64/vim-startuptime"
})
