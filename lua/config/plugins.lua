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

  "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
  "windwp/nvim-autopairs", -- Autopair, integrates with cmp ans treesitter
  "numToStr/Comment.nvim", -- Easyliy comment stuff

  {
    "folke/snacks.nvim",
    opts = {
      image = {
        formats = {
          "png",
          "jpg",
          "jpeg",
          "gif",
          "bmp",
          "webp",
          "tiff",
          "heic",
          "avif",
          "mp4",
          "mov",
          "avi",
          "mkv",
          "webm",
          "pdf",
          "icns",
          "svg",
          "svgz",
        },
      },
    },
  },

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

  "williamboman/mason.nvim",

  {
    "L3MON4D3/LuaSnip", -- snippet engine
    build = "make install_jsregexp",
  },
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets", -- a bunch of snippets

  -- LSP
  "neovim/nvim-lspconfig", -- enable LSP
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    config = function()
      require("config.trouble")
    end,
  },
  {
    "b0o/schemastore.nvim",
  },
  -- Formatter
  { "stevearc/conform.nvim" },

  -- Linters without LSP
  "mfussenegger/nvim-lint",

  -- Command line
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("config.noice")
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope-media-files.nvim",
      "nvim-telescope/telescope-project.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      require("config.telescope")
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    init = function()
      vim.g.skip_ts_context_commentstring_module = true
    end,
    config = function()
      require("ts_context_commentstring").setup({
        enable_autocmd = false,
      })
    end,
  },
  "fladson/vim-kitty",

  -- Git
  "lewis6991/gitsigns.nvim",

  -- use "dstein64/vim-startuptime"
})
