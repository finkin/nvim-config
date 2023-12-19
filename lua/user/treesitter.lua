local configs = require("nvim-treesitter.configs")
configs.setup({
  auto_install = true,
  ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python", "go", "terraform" },
  sync_install = false,
  ignore_install = { "" },
  autopairs = { enable = true },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" },
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  },
})
