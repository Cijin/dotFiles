require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'gopls',
    'html',
    'templ',
    'clangd',
    'zls',
  }
})


vim.lsp.config('gopls', {
  settings = {
    gopls = {
      gofumpt = true,
    }
  }
})
vim.lsp.config('templ', {})
vim.lsp.config('html', {})
vim.lsp.config('ts_ls', {})
vim.lsp.config('clangd', {})
vim.lsp.config('zls', {})

vim.lsp.enable('sourcekit')
vim.lsp.config('sourcekit', {
  capabilities = {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
  },
})
vim.lsp.config('tailwindcss', {
  filetypes = { 'templ', 'html' },
  init_options = {
    userLanguages = {
      templ = "html"
    }
  }
})

vim.diagnostic.config({
  virtual_text = true
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  end
})
