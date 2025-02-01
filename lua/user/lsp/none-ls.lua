local none_ls_status_ok, none_ls = pcall(require, "none-ls")
if not none_ls_status_ok then
  return
end

local b = none_ls.builtins

none_ls.setup({
  sources = {
    b.code_actions.gitrebase,

    b.formatting.packer,
    b.formatting.prettier,
    b.formatting.black.with({ extra_args = { "--fast" } }),
    b.formatting.stylua,
    b.formatting.terraform_fmt,

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
