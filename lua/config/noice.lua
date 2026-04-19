require("noice").setup({
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},
	presets = {
		bottom_search = false,
		command_palette = false,
	},
	messages = {
		view_error = "popup",
		view_warn = "popup",
	},
	notify = {
		view = "mini",
	},
})
