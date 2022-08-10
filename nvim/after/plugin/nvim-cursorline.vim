lua << END
require('nvim-cursorline').setup {
  cursorline = {
    enable = true,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
}
END
