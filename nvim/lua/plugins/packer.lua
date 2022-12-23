-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)

  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }

  -- telescope
  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-lua/plenary.nvim' }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' }, { 'nvim-lua/popup.nvim' } }
  }

  -- colorscheme
  use {'navarasu/onedark.nvim'}

  use { 'theprimeagen/harpoon' }

  -- undo logs
  use { 'mbbill/undotree' }

  -- git
  use { 'tpope/vim-fugitive' }

  -- File explorere with icons
  use { 'kyazdani42/nvim-web-devicons' }

  -- Dashboard
  use { 'goolord/alpha-nvim' }

  -- Status Bar
  use {
    "nvim-lualine/lualine.nvim",
    requires = {{
      "kyazdani42/nvim-web-devicons", opt=true
    }}
  }

  -- bracket colorizer
  use { "lukas-reineke/indent-blankline.nvim" }

  -- surround(ex. ysiw{ )
  use {
    'kylechui/nvim-surround',
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  }

  -- todo comments colorizer
  use {
    'folke/todo-comments.nvim',
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require('todo-comments').setup {}
    end
  }

  -- jump to next symentic when tapping in insert mode
  use {
    'abecodes/tabout.nvim',
    config = function() 
      require('tabout').setup {}
    end,
    wants = {'nvim-treesitter'},
    after = {'nvim-cmp'},
  }

  use { "folke/zen-mode.nvim" }
  use { "github/copilot.vim" }

  use { "christoomey/vim-tmux-navigator" }

  use { 'nvim-treesitter/nvim-treesitter' }

  -- LSP
  use {
    'tami5/lspsaga.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      {
        'williamboman/mason.nvim',
        config = function()
          require("mason").setup()
        end
      },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Command Line
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-cmdline'},
    }
  }

  use {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end
  }


  -- Debugger
  use { 'mfussenegger/nvim-dap' }

  -- for flutter
  use { 'akinsho/flutter-tools.nvim', requires={{'nvim-lua/plenary.nvim'}} }
  -- for dart
  use { 'dart-lang/dart-vim-plugin' }

  -- for rust
  use { "simrat39/rust-tools.nvim" }

  -- inspector
  use { 'puremourning/vimspector' }

end)
