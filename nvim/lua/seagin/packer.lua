vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- View stuff
  use 'vague-theme/vague.nvim'
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use 'folke/todo-comments.nvim'

  -- tpope
  use('tpope/vim-fugitive')
  use('tpope/vim-surround')
end)
