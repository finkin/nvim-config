return {
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
}
