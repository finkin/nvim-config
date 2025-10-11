local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end

gitsigns.setup {
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "_" },
    topdelete = { text = "_¯" },
    changedelete = { text = "~_" },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  attach_to_untracked = true,
}
