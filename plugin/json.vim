" Beautify JSON
function! JSONPretty()
  :%!jq .
endfunction

" Minify JSON
function! JSONRaw()
  :%!jq -c
endfunction

augroup json_ft
  autocmd BufNewFile,BufRead *.ndjson set filetype=json
  autocmd FileType json nmap <Leader>jsp :call JSONPretty()<cr>
  autocmd FileType json nmap <Leader>jsr :call JSONRaw()<cr>
  autocmd FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
augroup END

command! -range JSONRaw <line1>,<line2>call JSONRaw()
command! -range JSONFormat <line1>,<line2>call JSONPretty()
