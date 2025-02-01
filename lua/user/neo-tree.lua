local status_ok, neotree = pcall(require, "neo-tree")
if not status_ok then
  return
end

neotree.setup({
  window = {
    mappings = {
      ["h"] = "close_node", --use vim motions to
      ["l"] = "open",       --navigate the file system
      ["<CR>"] = "open",
    }
  }
})

