lua << EOF
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'ayu_mirage',
  },
  sections = {
    lualine_x = {'filetype'},
  },
  extensions = { 'fugitive' }
}
EOF
