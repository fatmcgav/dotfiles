return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, opts)
    local null_ls = require "null-ls"
    opts.sources = {
      -- diagnostics
      null_ls.builtins.diagnostics.luacheck,
      null_ls.builtins.diagnostics.flake8,
      -- null_ls.builtins.diagnostics.pylint,
      null_ls.builtins.diagnostics.mypy,
      null_ls.builtins.diagnostics.shellcheck,
      null_ls.builtins.diagnostics.terraform_validate,
      null_ls.builtins.diagnostics.yamllint,

      -- formatting
      null_ls.builtins.formatting.black.with {
        extra_args = { "--line-length=120" }
      },
      null_ls.builtins.formatting.gofmt,
      null_ls.builtins.formatting.goimports,
      null_ls.builtins.formatting.isort,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.shfmt.with {
        args = { "-i", "2" },
      },
      null_ls.builtins.formatting.terraform_fmt,
    }
    return opts
  end,
}
