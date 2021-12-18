" Find files inside dotfiles
nnoremap <leader>df :lua require('telescope.builtin').find_files({ prompt_title = "< Dotfiles>", cwd = "$HOME/.dotfiles"})<CR>

" telescope -- git_worktrees integration
nnoremap <leader>wl :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <leader>wn :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>
