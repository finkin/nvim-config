local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "info", "hint" },
	symbols = { error = " ", warn = " ", info = " ", hint = " " },
	colored = true,
	update_in_insert = true,
}

local lsp = {
	function()
		local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
		local clients = vim.lsp.get_clients()
		if next(clients) == nil then
			return "(no lsp)"
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return "(" .. client.name .. ")"
			end
		end
	end,
}

local mixed_spaces = {
	function()
		local space_pat = [[\v^ +]]
		local tab_pat = [[\v^\t+]]
		local space_indent = vim.fn.search(space_pat, "nwc")
		local tab_indent = vim.fn.search(tab_pat, "nwc")
		local mixed = (space_indent > 0 and tab_indent > 0)
		local mixed_same_line
		if not mixed then
			mixed_same_line = vim.fn.search([[\v^(\t+ | +\t)]], "nwc")
			mixed = mixed_same_line > 0
		end
		if not mixed then
			return ""
		end
		if mixed_same_line ~= nil and mixed_same_line > 0 then
			return "MI:" .. mixed_same_line
		end
		local space_indent_cnt = vim.fn.searchcount({ pattern = space_pat, max_count = 1e3 }).total
		local tab_indent_cnt = vim.fn.searchcount({ pattern = tab_pat, max_count = 1e3 }).total
		if space_indent_cnt > tab_indent_cnt then
			return "MI:" .. tab_indent
		else
			return "MI:" .. space_indent
		end
	end,
}

lualine.setup({
	options = {
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "neo-tree", "Outline" },
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { { "branch", icon = "" }, { "diff", colored = false } },
		lualine_c = { diagnostics },
		lualine_x = { "searchcount", "filetype", lsp },
		lualine_y = { "encoding", "fileformat", mixed_spaces, "filesize" },
		lualine_z = { "%p%%/%L" },
	}
})
