fun! TrimWhitespace()
	let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup TRIMTRIMTRIM
  autocmd!
  autocmd BufWritePre * :call TrimWhitespace()
augroup END

" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END
