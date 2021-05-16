" Find files inside dotfiles
nnoremap <leader>df :lua require('telescope.builtin').find_files({ prompt_title = "< Dotfiles>", cwd = "$HOME/.dotfiles"})<CR>
