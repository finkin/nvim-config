vim.api.nvim_create_autocmd("PackChanged", {
  group = vim.api.nvim_create_augroup("PluginBuilds", { clear = true }),
  callback = function(event)
    local plugin = event.data
    if plugin.kind ~= "install" and plugin.kind ~= "update" then
      return
    end

    if plugin.spec.name == "LuaSnip" then
      local result = vim.system({ "make", "install_jsregexp" }, { cwd = plugin.path, text = true }):wait()
      if result.code ~= 0 then
        error("LuaSnip build failed:\n" .. result.stderr .. result.stdout)
      end
    elseif plugin.spec.name == "nvim-treesitter" then
      vim.cmd.packadd("nvim-treesitter")
      vim.cmd.TSUpdate()
    end
  end,
})

vim.pack.add({
  -- Shared dependencies
  { src = "https://github.com/nvim-lua/plenary.nvim.git" },
  { src = "https://github.com/MunifTanjim/nui.nvim.git" },

  -- UI
  { src = "https://github.com/folke/tokyonight.nvim.git" },
  { src = "https://github.com/catppuccin/nvim.git", name = "catppuccin" },
  { src = "https://github.com/kepano/flexoki-neovim.git", name = "flexoki" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons.git" },
  { src = "https://github.com/folke/snacks.nvim.git" },
  { src = "https://github.com/akinsho/bufferline.nvim.git" },
  { src = "https://github.com/nvim-lualine/lualine.nvim.git" },
  { src = "https://github.com/folke/trouble.nvim.git" },

  -- Editor
  { src = "https://github.com/hrsh7th/nvim-cmp.git" },
  { src = "https://github.com/hrsh7th/cmp-buffer.git" },
  { src = "https://github.com/hrsh7th/cmp-path.git" },
  { src = "https://github.com/hrsh7th/cmp-cmdline.git" },
  { src = "https://github.com/hrsh7th/cmp-nvim-lsp.git" },
  { src = "https://github.com/L3MON4D3/LuaSnip.git" },
  { src = "https://github.com/saadparwaiz1/cmp_luasnip.git" },
  { src = "https://github.com/rafamadriz/friendly-snippets.git" },
  { src = "https://github.com/windwp/nvim-autopairs.git" },
  { src = "https://github.com/tpope/vim-surround.git" },
  { src = "https://github.com/moll/vim-bbye.git" },
  { src = "https://github.com/lewis6991/gitsigns.nvim.git" },
  { src = "https://github.com/stevearc/conform.nvim.git" },
  { src = "https://github.com/mfussenegger/nvim-lint.git" },

  -- LSP
  { src = "https://github.com/williamboman/mason.nvim.git" },
  { src = "https://github.com/neovim/nvim-lspconfig.git" },
  { src = "https://github.com/b0o/schemastore.nvim.git" },

  -- Treesitter
  { src = "https://github.com/nvim-treesitter/nvim-treesitter.git", version = "main" },

  -- Utilities
  { src = "https://github.com/nvim-neo-tree/neo-tree.nvim.git", version = "v3.x" },
  { src = "https://github.com/nvim-telescope/telescope.nvim.git" },
  { src = "https://github.com/nvim-telescope/telescope-media-files.nvim.git" },
  { src = "https://github.com/nvim-telescope/telescope-project.nvim.git" },
  { src = "https://github.com/nvim-telescope/telescope-ui-select.nvim.git" },
})

-- Mason runs before Treesitter so its executables are available for parser installs.
require("plugins.ui")
require("plugins.lsp")
require("plugins.treesitter")
require("plugins.editor")
require("plugins.util")
