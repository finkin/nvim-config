return {
  root_dir = function(bufnr, on_dir)
    local project_root = vim.fs.root(bufnr, function(name)
      return name:match("%.csproj$") ~= nil
    end)

    if project_root then
      on_dir(project_root)
      return
    end

    local solution_root = vim.fs.root(bufnr, function(name)
      return name:match("%.slnx?$") ~= nil
    end)

    if solution_root then
      on_dir(solution_root)
    end
  end,
}
