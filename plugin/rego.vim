let g:neoformat_rego_opa = {
      \ 'exe': 'opa',
      \ 'args': ['fmt'],
      \ 'stdin': 1,
      \ }

let g:neoformat_enabled_rego = ['opa']

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
