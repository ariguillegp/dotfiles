vim.g.neoformat_rego_opa = {exe = "opa", args = {"fmt"}, stdin = 1}

vim.g.neoformat_enabled_rego = {"opa"}

vim.api.nvim_create_autocmd({"BufWritePre"}, {
    group = vim.api.nvim_create_augroup("fmt", {clear = true}),
    pattern = "*",
    command = "undojoin | Neoformat"
})
