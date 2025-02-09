vim.api.nvim_create_autocmd('TextChanged', {
  pattern = '*',
  callback = function()
    local qf_list = vim.fn.getqflist()
    local current_buf = vim.api.nvim_get_current_buf()

    local new_list = vim.tbl_filter(function(item)
      -- Skip items from other buffers
      if item.bufnr ~= current_buf then
        return true
      end
      -- Get the text at the quickfix position
      local lines = vim.api.nvim_buf_get_lines(current_buf, item.lnum - 1, item.lnum, false)
      if #lines == 0 then return false end
      local line = lines[1]
      -- Check if the text still matches
      return line:find(item.text, 1, true) ~= nil
    end, qf_list)

    if #new_list ~= #qf_list then
      vim.fn.setqflist(new_list)
    end
  end
})
