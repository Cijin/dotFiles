vim.g.mapleader = " "
vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.incsearch = true
vim.opt.hlsearch = false

vim.opt.termguicolors = true

vim.opt.scrolloff = 10				-- scroll page when cursor is 10 lines from top/bottom
vim.opt.sidescrolloff = 8				-- scroll page when cursor is 8 spaces from left/right
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

-- simpler than runnig it every time
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.cmd("silent !go fmt ./...")
    vim.cmd("edit!")
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.zig",
  callback = function()
    vim.cmd("silent !zig fmt .")
    vim.cmd("edit!")
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.templ",
  callback = function()
    vim.cmd("silent !templ fmt .")
    vim.cmd("edit!")
  end,
})
