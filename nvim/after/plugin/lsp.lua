require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'eslint',
    'tsserver',
    'gopls',
    'golangci_lint_ls',
    'html',
    'templ',
    'clangd',
  }
})

local lspconfig = require('lspconfig')

lspconfig.gopls.setup({
    settings = {
        gopls = {
            gofumpt = true
        }
    }
})

lspconfig.golangci_lint_ls.setup {
	filetypes = {'go'}
}

lspconfig.tsserver.setup({})
lspconfig.templ.setup({})

-- ensure vscode-langservers-extracted is installed (npm i -g vscode-langservers-extracted)
lspconfig.html.setup({})
lspconfig.tailwindcss.setup({
  filetypes = {
    'templ',
    'html'
  },
  init_options = {
    userLanguages = {
        templ = "html"
    }
  }
})

local lsp = require('lsp-zero').preset({})
lsp.set_preferences({
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  local opts = {buffer = bufnr, remap = false}

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
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
