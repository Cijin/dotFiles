lua << EOF
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
  },
  sections = {
    lualine_x = {'filetype'},
  },
  extensions = { 'fugitive' }
}
EOF
