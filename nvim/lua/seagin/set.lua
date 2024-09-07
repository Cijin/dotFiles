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

-- have a tab stop of 2, so have the color column at 80 / 2
-- as code tends to be more compact, it's a good guideline
-- for when branching has gotten out of hand
vim.opt.colorcolumn = "40"

vim.opt.updatetime = 50

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.templ",
    command = "set filetype=templ",
})

-- Format current buffer using LSP, except for Go files.
vim.api.nvim_create_autocmd("BufWrite", {
    pattern = "*", -- applies to all file types
    callback = function()
      -- Check if the current buffer's filetype is not 'go'.
      -- as gofmt will take care of the formatting and if you
      -- don't skip lsp.buf.format(), they get stuck in an inifinte
      -- loop trying to format each others fixes
      if vim.bo.filetype ~= "go" then
        -- Format the current buffer using Neovim's built-in LSP.
        vim.lsp.buf.format()
      end
    end,
  }
)
