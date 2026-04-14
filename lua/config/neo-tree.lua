local status_ok, neotree = pcall(require, "neo-tree")
if not status_ok then
	return
end

neotree.setup({
	log_level = "warn",
	window = {
		mappings = {
			["h"] = "close_node", --use vim motions to
			["l"] = "open", --navigate the file system
			["<CR>"] = "open",
			["P"] = {
				"toggle_preview",
				config = {
					use_float = true,
					use_snacks_image = true,
					use_image_nvim = false,
				},
			},
		},
	},
})
