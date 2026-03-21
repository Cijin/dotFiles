require'nvim-treesitter'.install { 'go', 'javascript', 'zig', 'lua', 'templ', 'c' }

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'go', 'javascript', 'zig', 'lua', 'templ', 'c' },
  callback = function() vim.treesitter.start() end,
})
