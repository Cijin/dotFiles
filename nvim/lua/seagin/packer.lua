vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- View stuff
  use 'oxidescheme/nvim'
  use 'folke/todo-comments.nvim'

  use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { {"nvim-lua/plenary.nvim"} }
  }

  -- tpope
  use('tpope/vim-fugitive')
  use('tpope/vim-surround')
end)
