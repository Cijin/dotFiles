require("seagin.set")
require("seagin.remap")

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'go', 'zig', 'templ', 'query' },
  callback = function() vim.treesitter.start() end,
})
