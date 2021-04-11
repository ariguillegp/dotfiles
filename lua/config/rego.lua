local utils = require('config.utils')
local vg = vim.g

vg.formatdef_rego = '"opa fmt"'
vg.formatters_rego = 'rego'
vg.autoformat_autoindent = 0
vg.autoformat_retab = 0
vg.autoformat_verbosemode = 1

-- Run :Autoformat right after saving the policy file
utils.create_augroup({
    { 'BufWritePre *.rego Autoformat' },
}, 'regofmt')
