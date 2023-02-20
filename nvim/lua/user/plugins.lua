local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | Lazy sync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

return lazy.setup({
  'nvim-lua/plenary.nvim', -- Useful lua functions used ny lots of plugins
  'windwp/nvim-autopairs', -- Autopairs, integrates with both cmp
  'windwp/nvim-ts-autotag', -- Autotags for ts
  { 'akinsho/bufferline.nvim', version = "v3.*", dependencies = 'nvim-tree/nvim-web-devicons' },
  'moll/vim-bbye',
  'akinsho/toggleterm.nvim',

  -- telescope
  {
    "lmburns/lf.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "akinsho/toggleterm.nvim" },
  },
  {
    'nvim-telescope/telescope.nvim', version = '0.1.0',
    -- or                            , branch = '0.1.x',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
    }
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },


  -- theme
  'catppuccin/nvim',

  'theprimeagen/harpoon',

  -- undo logs
  'mbbill/undotree',

  -- git signs
  'lewis6991/gitsigns.nvim',

  -- Dashboard
  'goolord/alpha-nvim',

  -- Status Bar
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      {
        'nvim-tree/nvim-web-devicons', lazy = true
      },
    }
  },

  -- indent blanckliner
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("indent_blankline").setup {
        show_current_context = true,
        show_current_context_start = true,
      }
    end
  },
  'norcalli/nvim-colorizer.lua',

  -- surround(ex. ysiw{ )
  {
    'kylechui/nvim-surround',
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },

  -- todo comments colorizer
  {
    'folke/todo-comments.nvim',
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require('todo-comments').setup {}
    end
  },

  -- commentary
  { 'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },

  'folke/zen-mode.nvim',
  'github/copilot.vim',

  'christoomey/vim-tmux-navigator',

  { 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate",
    dependencies = {
      'hrsh7th/nvim-cmp',
      dependencies = {
        'abecodes/tabout.nvim',
        config = function()
          require('tabout').setup {}
        end,
      }
    }, -- The completion plugin
  },
  'nvim-treesitter/playground',

  -- LSP Support
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  -- 'jose-elias-alvarez/null-ls.nvim',

  -- Autocompletion
  'hrsh7th/cmp-buffer', -- buffer completions
  'hrsh7th/cmp-path', -- path completions
  'hrsh7th/cmp-cmdline', -- cmdline completions
  'saadparwaiz1/cmp_luasnip', -- snippet completions
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lua',

  -- Snippets
  'L3MON4D3/LuaSnip', -- snippet engine
  'rafamadriz/friendly-snippets', -- a bunch of snippets to use

  -- flutter only
  -- use { 'thosakwe/vim-flutter' }
  { 'akinsho/flutter-tools.nvim', dependencies = 'nvim-lua/plenary.nvim',
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
  },

  -- inspector
  'puremourning/vimspector',

  -- leap
  { 'ggandor/leap.nvim',
    config = function()
      require("leap").add_default_mappings()
    end
  },

  -- markdown preview
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  },

})
