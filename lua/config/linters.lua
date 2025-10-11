local lint = require("lint")


lint.linters_by_ft = {
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  yaml = { 'yamllint' }, -- General YAML linting
  json = { 'cfn_lint' },
  python = { "pylint" },
  markdown = { 'vale' },
  dockerfile = { 'hadolint' },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    local filepath = vim.fn.expand('%:p')
    -- Add specialized linters on top of yamllint
    if filepath:match('%.github/workflows/') then
      lint.try_lint('actionlint')
    elseif filepath:match('cloudformation/')
      or filepath:match('cfn')
      or filepath:match('%.template%.ya?ml$') then
      lint.try_lint('cfn_lint')
    end
    lint.try_lint()
  end,
})
