lua << END
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "typescript", "javascript", "bash", "css", "go", "html" },

  sync_install = false,

  highlight = {
--  enable = true,
    additional_vim_regex_highlighting = false,
  },
}
END
