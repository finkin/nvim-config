local configs = require("nvim-treesitter.configs")
configs.setup {
  ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python", "go" },
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  auto_install = true,
  autopairs = {
      enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,

  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
      enable = true,
      enable_autocmd = false,
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true,  -- Also highlight non-bracket delimiters like html tags
    max_file_lines = nil,  -- Do not enable for files with more than n lines, int
    -- colors = {},  -- table of hex strings
    -- termcolors = {} -- table of color name strings
  }
}
