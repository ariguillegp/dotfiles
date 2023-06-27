local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.opacheck,
        null_ls.builtins.diagnostics.deadnix,
        null_ls.builtins.diagnostics.gitlint,
        null_ls.builtins.diagnostics.tfsec,
        null_ls.builtins.diagnostics.hadolint, null_ls.builtins.formatting.rego,
        null_ls.builtins.formatting.nixfmt
    }
})
