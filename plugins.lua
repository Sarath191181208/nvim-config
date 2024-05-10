local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "bottom",
          },
          height = 0.95,
          prompt_position = "bottom",
        },
      },
    },
  },

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "NvChad/nvterm",
    opts = overrides.nvterm,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "tpope/vim-fugitive",
    opts = overrides.fugitive,
    lazy = false,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    event = { "InsertEnter" },
    cmd = { "Copilot" },
    opts = overrides.copilot,
    lazy = false,
    config = function()
      require("copilot").setup {}
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  {
    "mg979/vim-visual-multi",
    lazy = false,
    init = function()
      vim.g.VM_maps = {
        ["Find Under"] = "<leader><C-d>",
      }
    end,
  },
  {
    "ThePrimeagen/vim-be-good",
    event = "VeryLazy",
  },
  {
    "rmagatti/auto-session",
    lazy = false,
    opts = overrides.auto_session,
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
  {
    "tpope/vim-dadbod",
    event = "VeryLazy"
  },
  {
    "kristijanhusak/vim-dadbod-ui",
  },
  {
    "kristijanhusak/vim-dadbod-completion"
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false
  }
}

return plugins
