-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- toggle netrw view
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move visually selected lines of code up and down
vim.keymap.set("n", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("n", "K", ":m '<-2<CR>gv=gv")

-- appends next line to current line and keeps the cursor in the same position
vim.keymap.set("n", "J", "mzJ`z")

-- scrolls up and down but keeps the cursor in the middle of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- search and keep my cursor in the middle of the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "n", "nzzzv")
-- next greatest remap ever : asbjornHaland
-- copies the target text to the clipboard so I can paste it everywhere in the OS
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- copy everything from the current position to the end of the line
vim.keymap.set("n", "Y", "yg$")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

-- don't ever press Q
vim.keymap.set("n", "Q", "<nop>")
-- fuzzy finds tmux sessions
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww smux<CR>")
-- makes your current file executable
vim.keymap.set("n", "<C-x>", "<cmd>silent !chmod +x %<CR>")

vim.keymap.set("n", "<leader>f", vim.cmd.Format, { desc = "Apply LSP builtin format" })

-- quickfix list navigation
-- vim.keymap.set("n", "<S-C-j>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<S-C-h>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>c", "<cmd>cclose<CR>")

-- window navigation with vim keys
vim.keymap.set("n", "<leader>h", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<leader>j", "<cmd>wincmd j<CR>")
vim.keymap.set("n", "<leader>k", "<cmd>wincmd k<CR>")
vim.keymap.set("n", "<leader>l", "<cmd>wincmd l<CR>")
