vim.api.nvim_create_autocmd("TextChanged", {
  pattern = "*",
  callback = function()
    local qf_list = vim.fn.getqflist()
    local current_buf = vim.api.nvim_get_current_buf()
    local line_count = vim.api.nvim_buf_line_count(current_buf)

    local new_list = vim.tbl_filter(function(item)
      -- Skip items from other buffers
      if item.bufnr ~= current_buf then
        return true
      end

      -- Keep entries without a source location, and only remove locations that
      -- can no longer exist after edits.
      if not item.lnum or item.lnum <= 0 then
        return true
      end

      return item.lnum <= line_count
    end, qf_list)

    if #new_list ~= #qf_list then
      vim.fn.setqflist({}, "r", { items = new_list })
    end
  end,
})
