local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local b = null_ls.builtins

null_ls.setup({
  sources = {
    --[[ b.code_actions.gitsigns.with( ]]
    --[[   { ]]
    --[[     config = { ]]
    --[[       filter_actions = function (title) ]]
    --[[         return title:lower():match("blame") == nil --filter out blame actions ]]
    --[[       end ]]
    --[[     }, ]]
    --[[   } ]]
    --[[ ), ]]
    b.code_actions.gitrebase,

    b.formatting.packer,
    b.formatting.prettier,
    b.formatting.black.with({ extra_args = { "--fast" } }),
    b.formatting.stylua,

    b.diagnostics.actionlint,
    b.diagnostics.cfn_lint,
    b.diagnostics.eslint,
    b.diagnostics.flake8,
    b.diagnostics.gitlint,
    b.diagnostics.hadolint,
    b.diagnostics.write_good,
    b.hover.dictionary,
  },
})
