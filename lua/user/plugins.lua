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
    }
  },

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

  {
    "L3MON4D3/LuaSnip", -- snippet engine
    build = "make install_jsregexp"
  },
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets", -- a bunch of snippets

  -- LSP
  "neovim/nvim-lspconfig", -- enable LSP
  {
    "nvimtools/none-ls.nvim",  -- for formatters and linters, former null-ls
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  "arkav/lualine-lsp-progress",
  "glepnir/lspsaga.nvim",
  "folke/trouble.nvim",

  -- COPILOT
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end
  },
  'AndreM222/copilot-lualine',

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

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
  }
  -- use "dstein64/vim-startuptime"
})
