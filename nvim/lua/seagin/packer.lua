vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- View stuff
  use { "bluz71/vim-moonfly-colors", { as = 'moonfly' }}
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { {"nvim-lua/plenary.nvim"} }
  }

  use {
    'm4xshen/hardtime.nvim',
    config = function()
      require('hardtime').setup()
    end
  }

  -- tpope
  use('tpope/vim-fugitive')
  use('tpope/vim-surround')

  -- LSP Support
  use { "nvimtools/none-ls.nvim" }
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional
    }
  }

  use {
    'folke/todo-comments.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use('ray-x/go.nvim')
  use('ziglang/zig.vim')
end)
