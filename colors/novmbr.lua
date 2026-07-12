-- ghostty.lua
-- Neovim colorscheme converted from Ghostty terminal theme
-- Place in ~/.config/nvim/colors/ghostty.lua and set via :colorscheme ghostty

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "ghostty"
vim.o.background = "dark"

local c = {
  -- Base palette
  bg        = "#241d1a",
  fg        = "#c7b8ac",
  cursor    = "#c7b8ac",
  sel_bg    = "#c7b8ac",
  sel_fg    = "#241d1a",

  -- Normal colors (0–7)
  black     = "#282a2e",
  red       = "#9f6434",
  green     = "#9dac5f",
  yellow    = "#cca75f",
  blue      = "#2f7d7c",
  magenta   = "#b5896e",
  cyan      = "#52877f",
  white     = "#c7b8ac",

  -- Bright colors (8–15)
  br_black  = "#5d4e47",
  br_red    = "#9f6434",
  br_green  = "#9dac5f",
  br_yellow = "#cca75f",
  br_blue   = "#2f7d7c",
  br_mag    = "#b5896e",
  br_cyan   = "#52877f",
  br_white  = "#c7b8ac",

  -- Derived / convenience
  bg1       = "#2e2420",  -- slightly lighter than bg, for cursorline
  bg2       = "#3a302b",  -- sidebars, float backgrounds
  bg3       = "#4a3d37",  -- inactive status, borders
  comment   = "#7a6a60",  -- muted mid-tone
  none      = "NONE",
}

local hl = vim.api.nvim_set_hl

-- ─── Editor chrome ───────────────────────────────────────────────────────────
hl(0, "Normal",          { fg = c.fg,       bg = c.bg })
hl(0, "NormalFloat",     { fg = c.fg,       bg = c.bg2 })
hl(0, "NormalNC",        { fg = c.fg,       bg = c.bg })
hl(0, "EndOfBuffer",     { fg = c.black,    bg = c.none })

hl(0, "CursorLine",      { bg = c.bg1 })
hl(0, "CursorColumn",    { bg = c.bg1 })
hl(0, "CursorLineNr",    { fg = c.yellow,   bg = c.bg1,  bold = true })
hl(0, "LineNr",          { fg = c.comment,  bg = c.none })
hl(0, "SignColumn",      { fg = c.comment,  bg = c.none })

hl(0, "ColorColumn",     { bg = c.bg2 })
hl(0, "VertSplit",       { fg = c.bg3,      bg = c.none })
hl(0, "WinSeparator",    { fg = c.bg3,      bg = c.none })

hl(0, "Folded",          { fg = c.comment,  bg = c.bg2 })
hl(0, "FoldColumn",      { fg = c.comment,  bg = c.none })

hl(0, "Visual",          { fg = c.sel_fg,   bg = c.sel_bg })
hl(0, "VisualNOS",       { fg = c.sel_fg,   bg = c.sel_bg })

hl(0, "Search",          { fg = c.bg,       bg = c.yellow })
hl(0, "IncSearch",       { fg = c.bg,       bg = c.magenta })
hl(0, "CurSearch",       { fg = c.bg,       bg = c.yellow, bold = true })

hl(0, "MatchParen",      { fg = c.yellow,   bg = c.none, bold = true, underline = true })

hl(0, "StatusLine",      { fg = c.fg,       bg = c.bg2 })
hl(0, "StatusLineNC",    { fg = c.comment,  bg = c.bg3 })

hl(0, "TabLine",         { fg = c.comment,  bg = c.bg2 })
hl(0, "TabLineSel",      { fg = c.fg,       bg = c.bg3,  bold = true })
hl(0, "TabLineFill",     { bg = c.bg })

hl(0, "WildMenu",        { fg = c.bg,       bg = c.yellow })
hl(0, "Pmenu",           { fg = c.fg,       bg = c.bg2 })
hl(0, "PmenuSel",        { fg = c.bg,       bg = c.cyan })
hl(0, "PmenuSbar",       { bg = c.bg3 })
hl(0, "PmenuThumb",      { bg = c.comment })

hl(0, "FloatBorder",     { fg = c.bg3,      bg = c.bg2 })
hl(0, "FloatTitle",      { fg = c.yellow,   bg = c.bg2,  bold = true })

hl(0, "NonText",         { fg = c.bg3 })
hl(0, "SpecialKey",      { fg = c.bg3 })
hl(0, "Whitespace",      { fg = c.bg3 })
hl(0, "Conceal",         { fg = c.comment })

hl(0, "Directory",       { fg = c.blue })
hl(0, "Title",           { fg = c.yellow,   bold = true })

hl(0, "DiffAdd",         { fg = c.green,    bg = c.none })
hl(0, "DiffChange",      { fg = c.yellow,   bg = c.none })
hl(0, "DiffDelete",      { fg = c.red,      bg = c.none })
hl(0, "DiffText",        { fg = c.yellow,   bg = c.bg2,  bold = true })

hl(0, "SpellBad",        { sp = c.red,      undercurl = true })
hl(0, "SpellCap",        { sp = c.yellow,   undercurl = true })
hl(0, "SpellLocal",      { sp = c.cyan,     undercurl = true })
hl(0, "SpellRare",       { sp = c.magenta,  undercurl = true })

hl(0, "ErrorMsg",        { fg = c.red,      bold = true })
hl(0, "WarningMsg",      { fg = c.yellow })
hl(0, "ModeMsg",         { fg = c.fg,       bold = true })
hl(0, "MoreMsg",         { fg = c.cyan })
hl(0, "Question",        { fg = c.cyan })

-- ─── Syntax ───────────────────────────────────────────────────────────────────
hl(0, "Comment",         { fg = c.comment,  italic = true })
hl(0, "Constant",        { fg = c.magenta })
hl(0, "String",          { fg = c.green })
hl(0, "Character",       { fg = c.green })
hl(0, "Number",          { fg = c.magenta })
hl(0, "Boolean",         { fg = c.magenta })
hl(0, "Float",           { fg = c.magenta })

hl(0, "Identifier",      { fg = c.fg })
hl(0, "Function",        { fg = c.yellow })

hl(0, "Statement",       { fg = c.red })
hl(0, "Conditional",     { fg = c.red })
hl(0, "Repeat",          { fg = c.red })
hl(0, "Label",           { fg = c.red })
hl(0, "Operator",        { fg = c.cyan })
hl(0, "Keyword",         { fg = c.red })
hl(0, "Exception",       { fg = c.red })

hl(0, "PreProc",         { fg = c.cyan })
hl(0, "Include",         { fg = c.cyan })
hl(0, "Define",          { fg = c.cyan })
hl(0, "Macro",           { fg = c.cyan })
hl(0, "PreCondit",       { fg = c.cyan })

hl(0, "Type",            { fg = c.yellow })
hl(0, "StorageClass",    { fg = c.yellow })
hl(0, "Structure",       { fg = c.yellow })
hl(0, "Typedef",         { fg = c.yellow })

hl(0, "Special",         { fg = c.magenta })
hl(0, "SpecialChar",     { fg = c.magenta })
hl(0, "Tag",             { fg = c.red })
hl(0, "Delimiter",       { fg = c.fg })
hl(0, "SpecialComment",  { fg = c.comment,  italic = true })
hl(0, "Debug",           { fg = c.red })

hl(0, "Underlined",      { underline = true })
hl(0, "Ignore",          { fg = c.comment })
hl(0, "Error",           { fg = c.red,      bold = true })
hl(0, "Todo",            { fg = c.bg,       bg = c.yellow, bold = true })

-- ─── Treesitter ───────────────────────────────────────────────────────────────
hl(0, "@comment",              { link = "Comment" })
hl(0, "@comment.documentation",{ fg = c.comment, italic = true })
hl(0, "@punctuation",          { fg = c.fg })
hl(0, "@punctuation.bracket",  { fg = c.br_black })
hl(0, "@punctuation.delimiter",{ fg = c.fg })
hl(0, "@punctuation.special",  { fg = c.cyan })

hl(0, "@constant",             { link = "Constant" })
hl(0, "@constant.builtin",     { fg = c.magenta, italic = true })
hl(0, "@constant.macro",       { fg = c.cyan })
hl(0, "@string",               { link = "String" })
hl(0, "@string.escape",        { fg = c.magenta })
hl(0, "@string.special",       { fg = c.magenta })
hl(0, "@character",            { link = "Character" })
hl(0, "@number",               { link = "Number" })
hl(0, "@boolean",              { link = "Boolean" })
hl(0, "@float",                { link = "Float" })

hl(0, "@function",             { link = "Function" })
hl(0, "@function.builtin",     { fg = c.cyan })
hl(0, "@function.macro",       { fg = c.cyan })
hl(0, "@function.method",      { fg = c.yellow })
hl(0, "@parameter",            { fg = c.fg,  italic = true })
hl(0, "@variable",             { fg = c.fg })
hl(0, "@variable.builtin",     { fg = c.red,  italic = true })
hl(0, "@variable.member",      { fg = c.fg })
hl(0, "@property",             { fg = c.fg })

hl(0, "@keyword",              { link = "Keyword" })
hl(0, "@keyword.function",     { fg = c.red })
hl(0, "@keyword.operator",     { fg = c.cyan })
hl(0, "@keyword.return",       { fg = c.red })
hl(0, "@keyword.import",       { fg = c.cyan })
hl(0, "@keyword.conditional",  { fg = c.red })
hl(0, "@keyword.repeat",       { fg = c.red })
hl(0, "@operator",             { link = "Operator" })

hl(0, "@type",                 { link = "Type" })
hl(0, "@type.builtin",         { fg = c.yellow, italic = true })
hl(0, "@type.qualifier",       { fg = c.yellow })

hl(0, "@namespace",            { fg = c.blue })
hl(0, "@module",               { fg = c.blue })
hl(0, "@label",                { fg = c.red })
hl(0, "@tag",                  { fg = c.red })
hl(0, "@tag.attribute",        { fg = c.yellow })
hl(0, "@tag.delimiter",        { fg = c.comment })

-- ─── LSP ──────────────────────────────────────────────────────────────────────
hl(0, "DiagnosticError",            { fg = c.red })
hl(0, "DiagnosticWarn",             { fg = c.yellow })
hl(0, "DiagnosticInfo",             { fg = c.blue })
hl(0, "DiagnosticHint",             { fg = c.cyan })
hl(0, "DiagnosticOk",               { fg = c.green })

hl(0, "DiagnosticUnderlineError",   { sp = c.red,    undercurl = true })
hl(0, "DiagnosticUnderlineWarn",    { sp = c.yellow, undercurl = true })
hl(0, "DiagnosticUnderlineInfo",    { sp = c.blue,   undercurl = true })
hl(0, "DiagnosticUnderlineHint",    { sp = c.cyan,   undercurl = true })

hl(0, "LspReferenceText",           { bg = c.bg2 })
hl(0, "LspReferenceRead",           { bg = c.bg2 })
hl(0, "LspReferenceWrite",          { bg = c.bg2, bold = true })
hl(0, "LspInlayHint",               { fg = c.comment, italic = true })

-- ─── Gitsigns / git-blame ─────────────────────────────────────────────────────
hl(0, "GitSignsAdd",     { fg = c.green })
hl(0, "GitSignsChange",  { fg = c.yellow })
hl(0, "GitSignsDelete",  { fg = c.red })

-- ─── nvim-tree ────────────────────────────────────────────────────────────────
hl(0, "NvimTreeNormal",          { fg = c.fg,      bg = c.bg2 })
hl(0, "NvimTreeNormalFloat",     { fg = c.fg,      bg = c.bg2 })
hl(0, "NvimTreeRootFolder",      { fg = c.yellow,  bold = true })
hl(0, "NvimTreeFolderName",      { fg = c.blue })
hl(0, "NvimTreeOpenedFolderName",{ fg = c.blue,    bold = true })
hl(0, "NvimTreeFolderIcon",      { fg = c.blue })
hl(0, "NvimTreeEmptyFolderName", { fg = c.comment })
hl(0, "NvimTreeSymlink",         { fg = c.cyan })
hl(0, "NvimTreeExecFile",        { fg = c.green,   bold = true })
hl(0, "NvimTreeSpecialFile",     { fg = c.magenta, underline = true })
hl(0, "NvimTreeGitDirty",        { fg = c.yellow })
hl(0, "NvimTreeGitNew",          { fg = c.green })
hl(0, "NvimTreeGitDeleted",      { fg = c.red })
hl(0, "NvimTreeIndentMarker",    { fg = c.bg3 })
hl(0, "NvimTreeCursorLine",      { bg = c.bg3 })

-- ─── Telescope ────────────────────────────────────────────────────────────────
hl(0, "TelescopeNormal",         { fg = c.fg,      bg = c.bg2 })
hl(0, "TelescopeBorder",         { fg = c.bg3,     bg = c.bg2 })
hl(0, "TelescopeTitle",          { fg = c.yellow,  bg = c.bg2,  bold = true })
hl(0, "TelescopePromptPrefix",   { fg = c.red })
hl(0, "TelescopeSelection",      { fg = c.fg,      bg = c.bg3 })
hl(0, "TelescopeSelectionCaret", { fg = c.yellow,  bg = c.bg3 })
hl(0, "TelescopeMatching",       { fg = c.yellow,  bold = true })

-- ─── Which-key ────────────────────────────────────────────────────────────────
hl(0, "WhichKey",          { fg = c.cyan })
hl(0, "WhichKeyGroup",     { fg = c.blue })
hl(0, "WhichKeyDesc",      { fg = c.fg })
hl(0, "WhichKeySeparator", { fg = c.comment })
hl(0, "WhichKeyFloat",     { bg = c.bg2 })
hl(0, "WhichKeyBorder",    { fg = c.bg3,  bg = c.bg2 })

-- ─── indent-blankline ─────────────────────────────────────────────────────────
hl(0, "IblIndent",   { fg = c.bg2 })
hl(0, "IblScope",    { fg = c.bg3 })

-- ─── nvim-cmp ─────────────────────────────────────────────────────────────────
hl(0, "CmpItemAbbr",           { fg = c.fg })
hl(0, "CmpItemAbbrMatch",      { fg = c.yellow,   bold = true })
hl(0, "CmpItemAbbrMatchFuzzy", { fg = c.yellow })
hl(0, "CmpItemAbbrDeprecated", { fg = c.comment,  strikethrough = true })
hl(0, "CmpItemKind",           { fg = c.cyan })
hl(0, "CmpItemMenu",           { fg = c.comment })
hl(0, "CmpItemKindFunction",   { fg = c.yellow })
hl(0, "CmpItemKindMethod",     { fg = c.yellow })
hl(0, "CmpItemKindVariable",   { fg = c.fg })
hl(0, "CmpItemKindField",      { fg = c.fg })
hl(0, "CmpItemKindKeyword",    { fg = c.red })
hl(0, "CmpItemKindText",       { fg = c.green })
hl(0, "CmpItemKindSnippet",    { fg = c.magenta })
hl(0, "CmpItemKindClass",      { fg = c.blue })
hl(0, "CmpItemKindModule",     { fg = c.blue })
hl(0, "CmpItemKindInterface",  { fg = c.blue })
