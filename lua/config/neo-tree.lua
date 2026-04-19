local status_ok, neotree = pcall(require, "neo-tree")
if not status_ok then
	return
end

local function is_pdf(path)
	return type(path) == "string" and path:lower():match("%.pdf$") ~= nil
end

local function notify_missing_pdf_preview_dependency()
	vim.notify(
		"PDF previews need Ghostscript (`gs`) for ImageMagick. Install it with `brew install ghostscript`.",
		vim.log.levels.WARN,
		{ title = "Neo-tree Preview" }
	)
end

neotree.setup({
	log_level = "warn",
	commands = {
		toggle_preview_with_pdf_check = function(state)
			local node = state.tree:get_node()
			local path = node and (node.path or node:get_id())

			if is_pdf(path) and vim.fn.executable("gs") == 0 then
				notify_missing_pdf_preview_dependency()
				return
			end

			require("neo-tree.sources.common.commands").toggle_preview(state)
		end,
	},
	window = {
		mappings = {
			["h"] = "close_node", --use vim motions to
			["l"] = "open", --navigate the file system
			["<CR>"] = "open",
			["P"] = {
				"toggle_preview_with_pdf_check",
				config = {
					use_float = true,
					use_snacks_image = true,
					use_image_nvim = false,
				},
			},
		},
	},
})
