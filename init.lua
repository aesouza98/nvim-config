require('plugins.set')
require('plugins.keymaps')
require('plugins.set')
local fn = vim.fn

-- Auto install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Auto load packer when saved
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]]

-- Prevent first use error
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  git = {
    clone_timeout = 300, -- Timeout, in seconds, for git clones
  },
}

-- Start plugins configuration
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Auto manage Packer

  -- Colorschemes
  use {'catppuccin/nvim', as = 'catppuccin' }
  use {'folke/tokyonight.nvim', as = 'tokyonight' }
  use {'lunarvim/darkplus.nvim', as = 'darkplus' }

  vim.o.termguicolors = true
  vim.cmd('colorscheme darkplus') -- Set Colorscheme

  -- Comment
  use {
	  'numToStr/Comment.nvim',
	  config = function() require('Comment').setup {} end
  }

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  -- Impatient
  use { "lewis6991/impatient.nvim" }

  -- Treesitter
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')

  -- Harpoon
  use('ThePrimeagen/harpoon')

  -- Undotree
  use('mbbill/undotree')

  -- Fugitive
  use('tpope/vim-fugitive')

  -- Nvimtree
  use { "kyazdani42/nvim-web-devicons" }
  use { "kyazdani42/nvim-tree.lua" }
  require("nvim-tree").setup()

  -- Tabs
  use { "romgrk/barbar.nvim", wants = 'nvim-web-devicons' }

  -- Bufferline
  use { "akinsho/bufferline.nvim", tag = "v3.*", requires = "kyazdani42/nvim-web-devicons"}  use { "moll/vim-bbye"}

  -- Status bar
  use {
		  'nvim-lualine/lualine.nvim',
		  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  require('lualine').setup {
		  options = {
				  icons_enabled = true,
				  theme = 'darkplus',
		  },
  }

  -- Terminal Toggle
  use { "akinsho/toggleterm.nvim", tag = '*', config = function() 
  	end 
  }

  -- Indent Blankline
  use { "lukas-reineke/indent-blankline.nvim" }

  -- Dashboard
  use {
	  'goolord/alpha-nvim',
	  requires = { 'kyazdani42/nvim-web-devicons' },
	  config = function ()
		  require'alpha'.setup(require'alpha.themes.startify'.config)
	  end
  }

  -- Autosave
  use { "Pocco81/auto-save.nvim" }

  --LSP
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }
  if PACKER_BOOTSTRAP then
	  require("packer").sync()
  end
end)
