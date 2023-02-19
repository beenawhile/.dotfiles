local fn = vim.fn

-- Automatically install packer
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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp
  use "windwp/nvim-ts-autotag" -- Autotags for ts
  use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
  use "moll/vim-bbye"
  use "akinsho/toggleterm.nvim"

  -- telescope
  use {
    "lmburns/lf.nvim",
    requires = { "nvim-lua/plenary.nvim", "akinsho/toggleterm.nvim" },
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = {
      { 'nvim-lua/plenary.nvim' },
    }
  }
  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }


  -- theme
  use "catppuccin/nvim"

  use 'theprimeagen/harpoon'

  -- undo logs
  use { 'mbbill/undotree' }

  -- git signs
  use 'lewis6991/gitsigns.nvim'

  -- icons
  use { 'kyazdani42/nvim-web-devicons' }

  -- Dashboard
  use { 'goolord/alpha-nvim' }

  -- Status Bar
  -- -- style
  use { "xiyaowong/nvim-transparent",
    config = function()
      require("transparent").setup({
        enable = true,
      })
    end
  }
  use {
    "nvim-lualine/lualine.nvim",
    requires = { {
      "kyazdani42/nvim-web-devicons", opt = true
    } }
  }

  -- indent blanckliner
  use { "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {
        show_current_context = true,
        show_current_context_start = true,
      }
    end
  }
  use { 'norcalli/nvim-colorizer.lua' }

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

  -- commentary
  use "numToStr/Comment.nvim"


  -- jump to next symentic when tapping in insert mode
  use {
    'abecodes/tabout.nvim',
    config = function()
      require('tabout').setup {}
    end,
    wants = { 'nvim-treesitter' },
    after = { 'nvim-cmp' },
  }

  use { "folke/zen-mode.nvim" }
  use { "github/copilot.vim" }

  use { "christoomey/vim-tmux-navigator" }

  use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate" }
  use { 'nvim-treesitter/playground' }

  -- LSP Support
  use { 'neovim/nvim-lspconfig' }
  use { 'williamboman/mason.nvim' }
  use { 'williamboman/mason-lspconfig.nvim' }
  -- use { 'jose-elias-alvarez/null-ls.nvim' }

  -- Autocompletion
  use { 'hrsh7th/nvim-cmp' } -- The completion plugin
  use { 'hrsh7th/cmp-buffer' } -- buffer completions
  use { 'hrsh7th/cmp-path' } -- path completions
  use { 'hrsh7th/cmp-cmdline' } -- cmdline completions
  use { 'saadparwaiz1/cmp_luasnip' } -- snippet completions
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-nvim-lua' }

  -- Snippets
  use { 'L3MON4D3/LuaSnip' } -- snippet engine
  use { 'rafamadriz/friendly-snippets' } -- a bunch of snippets to use

  -- flutter only
  -- use { 'thosakwe/vim-flutter' }
  use { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim',
    config = function()
      require("flutter-tools").setup({
        enable = true,
        flutter_lookup_cmd = "asdf where flutter",
        decorations = {
          statusline = {
            -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
            -- this will show the current version of the flutter app from the pubspec.yaml file
            app_version = false,
            -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
            -- this will show the currently running device if an application was started with a specific
            -- device
            device = true,
          }
        },
      })
    end
  }

  -- inspector
  use { 'puremourning/vimspector' }

  -- leap
  use { 'ggandor/leap.nvim',
    config = function()
      require("leap").add_default_mappings()
    end
  }

  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
