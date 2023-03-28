local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	"nvim-lua/popup.nvim", -- Implementation of the Popup API from vim
	"nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
	"windwp/nvim-autopairs", -- Autopair, integrates with cmp ans treesitter
	"numToStr/Comment.nvim", -- Easyliy comment stuff

	{ "nvim-tree/nvim-tree.lua", dependencies = {
		"nvim-tree/nvim-web-devicons",
	} },

	"akinsho/bufferline.nvim", -- Buffers as tabs
	"moll/vim-bbye", -- Close buffers elegantly
	"nvim-lualine/lualine.nvim",
	"tpope/vim-surround",

	-- Themes
	{ "dracula/vim", as = "dracula" },
	{ "catppuccin/nvim", as = "catppuccin" },
	"folke/tokyonight.nvim",

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

	"L3MON4D3/LuaSnip", -- snippet engine
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets", -- a bunch of snippets

	-- LSP
	"neovim/nvim-lspconfig", -- enable LSP
	"jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
	"arkav/lualine-lsp-progress",
	"glepnir/lspsaga.nvim",
	"folke/trouble.nvim",

	-- DAP
	"mfussenegger/nvim-dap",

	-- Command line
	{ "folke/noice.nvim", dependencies = {
		"MunifTanjim/nui.nvim",
	} },

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
	"p00f/nvim-ts-rainbow",
	"fladson/vim-kitty",

	-- Git
	"lewis6991/gitsigns.nvim",

	"folke/which-key.nvim",

	{"ellisonleao/glow.nvim", config = true, cmd = "Glow"},
	-- use "dstein64/vim-startuptime"
  -- Pets
  {
    "giusgad/pets.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "giusgad/hologram.nvim" },
  }
})
