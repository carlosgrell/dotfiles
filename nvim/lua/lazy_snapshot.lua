return {
  { "AstroNvim/astrotheme", version = "^2", optional = true },
  { 'catppuccin/nvim' },
  { 'liuchengxu/space-vim-dark' },
  { 'rakr/vim-one' },
  { 'folke/tokyonight.nvim' },
  { 'projekt0n/github-nvim-theme' },
  { 'NTBBloodbath/doom-one.nvim' },
  { 'shaunsingh/nord.nvim' },
  { 'Mofiqul/dracula.nvim' },
  { 'EdenEast/nightfox.nvim' },
  { 'rose-pine/neovim' },
  { 'rebelot/kanagawa.nvim' },
  { "folke/neoconf.nvim",
    version = "^1",
    optional = false,
    cmd = "Neoconf",
    config = true,
  },
  { "jose-elias-alvarez/null-ls.nvim",
    optional = false,
    config = function()
      local null_ls = require "null-ls"
      null_ls.setup {
        sources = {
          -- null_ls.builtins.formatting.rufo,
          null_ls.builtins.diagnostics.rubocop,
        },
      }
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd =  "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "§",
            refresh = "gr",
            open = "<M-CR>"
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "§",
            accept_word = false,
            accept_line = false,
            next = "<]]>",
            prev = "<[[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = 'node', -- Node.js version must be > 16.x
        server_opts_overrides = {},

      })
    end,
  },
  { "karb94/neoscroll.nvim",
    event = "BufRead",
    config = function()
      require("neoscroll").setup()
    end,
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
    end,
  },
  { "JoosepAlviste/nvim-ts-context-commentstring", commit = "e9062e2dfb9854e6a927370f2d720de354c88524", optional = true },
  { "L3MON4D3/LuaSnip", version = "^2", optional = true },
  { "MunifTanjim/nui.nvim", version = "^0.1", optional = true },
  { "NMAC427/guess-indent.nvim", commit = "b8ae749fce17aa4c267eec80a6984130b94f80b2", optional = true },
  { "NvChad/nvim-colorizer.lua", commit = "dde3084106a70b9a79d48f426f6d6fec6fd203f7", optional = true },
  { "Shatur/neovim-session-manager", commit = "4883372b1ef2bdcf4cbdac44c98d68c216914462", optional = true },
  { "akinsho/toggleterm.nvim", version = "^2", optional = true },
  { "b0o/SchemaStore.nvim", commit = "fba131b5ef7a54a8f8d71ef2a2e8d2263b87daac", optional = true },
  { "echasnovski/mini.bufremove", commit = "7821606e35c1ac931b56d8e3155f45ffe76ee7e5", optional = true },
  { "folke/lazy.nvim", version = "^9", optional = true },
  { "folke/neodev.nvim", version = "^2", optional = true },
  { "folke/which-key.nvim", version = "^1", optional = true },
  { "goolord/alpha-nvim", commit = "e4fc5e29b731bdf55d204c5c6a11dc3be70f3b65", optional = true },
  { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa", optional = true },
  { "hrsh7th/cmp-nvim-lsp", commit = "44b16d11215dce86f253ce0c30949813c0a90765", optional = true },
  { "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23", optional = true },
  { "hrsh7th/nvim-cmp", commit = "c4e491a87eeacf0408902c32f031d802c7eafce8", optional = true },
  { "jay-babu/mason-null-ls.nvim", version = "^2", optional = true },
  { "jay-babu/mason-nvim-dap.nvim", version = "^2", optional = true },
  { "kevinhwang91/nvim-ufo", version = "^1", optional = true },
  { "kevinhwang91/promise-async", version = "^1", optional = true },
  { "lewis6991/gitsigns.nvim", version = "^0.6", optional = true },
  { "lukas-reineke/indent-blankline.nvim", version = "^2", optional = true },
  { "max397574/better-escape.nvim", commit = "7031dc734add47bb71c010e0551829fa5799375f", optional = true },
  { "mfussenegger/nvim-dap", version = "^0.6", optional = true },
  { "mrjones2014/smart-splits.nvim", version = "^1", optional = true },
  { "neovim/nvim-lspconfig", commit = "a59d74e12340242c0735666fb2e91afdbe6f2496", optional = true },
  { "numToStr/Comment.nvim", version = "^0.8", optional = true },
  { "nvim-lua/plenary.nvim", version = "^0.1", optional = true },
  { "nvim-neo-tree/neo-tree.nvim", version = "^3", optional = true },
  { "nvim-telescope/telescope-fzf-native.nvim", commit = "9bc8237565ded606e6c366a71c64c0af25cd7a50", optional = true },
  { "nvim-telescope/telescope.nvim", version = "^0.1", optional = true },
  { "nvim-tree/nvim-web-devicons", commit = "efbfed0567ef4bfac3ce630524a0f6c8451c5534", optional = true },
  { "nvim-treesitter/nvim-treesitter", commit = "4c4d586a05e236d8199ab6faab8cb733a9b5bd24", optional = true },
  { "nvim-treesitter/nvim-treesitter-textobjects", commit = "9e519b6146512c8e2e702faf8ac48420f4f5deec", optional = true },
  { "onsails/lspkind.nvim", commit = "57610d5ab560c073c465d6faf0c19f200cb67e6e", optional = true },
  { "rafamadriz/friendly-snippets", commit = "bc38057e513458cb2486b6cd82d365fa294ee398", optional = true },
  { "rcarriga/cmp-dap", commit = "d16f14a210cd28988b97ca8339d504533b7e09a4", optional = true },
  { "rcarriga/nvim-dap-ui", version = "^3", optional = true },
  { "rcarriga/nvim-notify", version = "^3", optional = true },
  { "rebelot/heirline.nvim", version = "^1", optional = true },
  { "s1n7ax/nvim-window-picker", version = "^2", optional = true },
  { "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566", optional = true },
  { "stevearc/aerial.nvim", version = "^1", optional = true },
  { "stevearc/dressing.nvim", version = "^1", optional = true },
  { "williamboman/mason-lspconfig.nvim", version = "^1.1", optional = true },
  { "williamboman/mason.nvim", version = "^1", optional = true },
  { "windwp/nvim-autopairs", commit = "ae5b41ce880a6d850055e262d6dfebd362bb276e", optional = true },
  { "windwp/nvim-ts-autotag", commit = "6be1192965df35f94b8ea6d323354f7dc7a557e4", optional = true },
}
