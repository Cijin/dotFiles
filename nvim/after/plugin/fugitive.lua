vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- Entire file
vim.keymap.set("n", "<leader>gf", ':%diffget //2<CR>', { noremap = true })
vim.keymap.set("n", "<leader>gj", ':%diffget //3<CR>', { noremap = true })

-- Block under cursor
vim.keymap.set("n", "<leader>gg", ':diffget //2<CR>', { noremap = true })
vim.keymap.set("n", "<leader>gh", ':diffget //3<CR>', { noremap = true })
