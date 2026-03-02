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

local servers = {
  gopls = {
    settings = {
      gopls = {
        gofumpt = true,
        semanticTokens = true,
      }
    }
  },
  sourcekit = {
    capabilities = {
      workspace = {
        didChangeWatchedFiles = {
          dynamicRegistration = true,
        },
      },
    },
  },
  tailwindcss = {
    filetypes = { 'templ', 'html' },
    init_options = {
      userLanguages = {
        templ = "html"
      }
    }
  },
  -- servers with no extra config
  templ = {},
  html = {},
  ts_ls = {},
  clangd = {},
  zls = {},
}

for server, config in pairs(servers) do
  vim.lsp.config(server, config)
  vim.lsp.enable(server)
end

vim.lsp.enable('sourcekit')

vim.diagnostic.config({ virtual_text = true })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
  end
})
