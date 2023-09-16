vim.g.mapleader = " "
-- remaping :Ex
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Save to clipboard
vim.keymap.set("x", "<leader>y", '"+y<ESC>', { noremap = true, silent = true})
