-- packer default settings
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- You can alias plugin names
  use{
    'wbthomason/packer.nvim',
    opt = true
  }

  use {
  'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim'
    },
    config = function ()
      require('plugins.001_neo-tree')
    end
  }

  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    },
    config = function()
      require('plugins.002_lualine')
    end
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    --opt = true,
    config = function()
      require('plugins.003_indent-blankline')
    end
  }

  use {
    "EdenEast/nightfox.nvim",
    config = function()
      require('plugins.004_nightfox')
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
      require('plugins.005_telescope')
    end
  }

  use {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('plugins.006_diffview')
    end
  }

  use {
    'williamboman/mason.nvim',
    config = function()
      require('plugins.007_mason')
    end
  }

  use {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup()
    end
  }

  use {
    'neovim/nvim-lspconfig',
    config = function()
      -- require'lspconfig'.sumneko_lua.setup{
      --   settings = {
      --     Lua = {
      --       diagnostics = {
      --         globals = {'vim'},
      --       },
      --       workspace = {
      --         library = vim.api.nvim_get_runtime_file("", true),
      --         checkThirdParty = false,
      --       },
      --     },
      --   },
      -- }

      require('lspconfig').gopls.setup{
        settings = {
          gopls = {
            analyses = {
              unusedparams = true
            },
            staticcheck = true,
            usePlaceholders = true,
            completeUnimported = true,
          },
        },
      }
    end
  }

end)

