local config = {

  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "nightly", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    -- remotes = { -- easily add new remotes to track
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    -- },
  },

  -- Set colorscheme
  -- colorscheme = "default_theme",
  -- colorscheme = "catppuccin",
  -- colorscheme = "doom-one",
  -- colorscheme = "tokyonight",
  -- colorscheme = "one",
  -- colorscheme = "one",
  colorscheme = "space-vim-dark",

  -- set vim options here (vim.<first_key>.<second_key> =  value)
  options = {
    opt = {
      relativenumber = false, -- sets vim.opt.relativenumber
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
    },
  },
  -- Default theme configuration
  default_theme = {
    diagnostics_style = { italic = true },
    -- Modify the color table
    colors = {
      fg = "#abb2bf",
      -- bg = "#333333",
    },
    -- Modify the highlight groups
    highlights = function(highlights)
      local C = require "default_theme.colors"

      highlights.Normal = { fg = C.fg, bg = C.bg }
      return highlights
    end,
    plugins = { -- enable or disable extra plugin highlighting
      aerial = true,
      beacon = false,
      bufferline = true,
      dashboard = true,
      highlighturl = true,
      hop = true,
      indent_blankline = true,
      lightspeed = false,
      ["neo-tree"] = true,
      notify = true,
      ["nvim-tree"] = false,
      ["nvim-web-devicons"] = true,
      rainbow = true,
      symbols_outline = false,
      telescope = true,
      vimwiki = false,
      ["which-key"] = true,
    },
  },

  -- Disable AstroNvim ui features
  ui = {
    nui_input = true,
    telescope_select = true,
  },

  -- Configure plugins
  plugins = {
    -- Add plugins, the packer syntax without the "use"
    init = {
      ["null-ls"] = { disable = true },
      -- You can disable default plugins as follows:
      -- ["goolord/alpha-nvim"] = { disable = true },

      -- You can also add new plugins here as well:
      -- { "andweeb/presence.nvim" },
      {
        "phaazon/hop.nvim",
        event = "BufRead",
        config = function()
          require("hop").setup()
        end,
      },
      { 'andymass/vim-matchup' },
      { 'catppuccin/nvim' },
      { 'liuchengxu/space-vim-dark' },
      { 'rakr/vim-one' },
      -- { 'folke/tokyonight.nvim' },
      -- { 'projekt0n/github-nvim-theme' },
      -- {
      --   'NTBBloodbath/doom-one.nvim',
      --   config = function()
      --     require('doom-one').setup({
      --       cursor_coloring = true,
      --       terminal_colors = false,
      --       italic_comments = true,
      --       enable_treesitter = true,
      --       transparent_background = false,
      --       pumblend = {
      --         enable = true,
      --         transparency_amount = 20,
      --       },
      --       plugins_integrations = {
      --         neorg = true,
      --         barbar = true,
      --         bufferline = true,
      --         gitgutter = true,
      --         gitsigns = true,
      --         telescope = true,
      --         neogit = true,
      --         nvim_tree = true,
      --         dashboard = true,
      --         startify = true,
      --         whichkey = true,
      --         indent_blankline = true,
      --         vim_illuminate = true,
      --         lspsaga = true,
      --       },
      --     })
      --   end
      -- },
    },
    -- All other entries override the setup() call for default plugins
    ["null-ls"] = function(config)
      local null_ls = require "null-ls"
      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set a formatter
        -- null_ls.builtins.formatting.rubocop,
        -- null_ls.builtins.diagnostics.standardrb,
        -- Set a linter
        -- null_ls.builtins.diagnostics.rubocop,
      }
      -- set up null-ls's on_attach function
      return config -- return final config table
    end,
    treesitter = {
      ensure_installed = { "lua" },
      matchup = { enable = true },
      endwise = { enable = true },
      config = { endwise = { enable = true } },
      configs = { endwise = { enable = true } },
    },
    ['neo-tree'] = {
      filesystem = {
        filtered_items = {
          visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
    ["nvim-lsp-installer"] = {
      ensure_installed = { "sumneko_lua", "solargraph" },
    },
    packer = {
      compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    },
  },

  -- LuaSnip Options
  luasnip = {
    -- Add paths for including more VS Code style snippets in luasnip
    vscode_snippet_paths = {},
    -- Extend filetypes
    filetype_extend = {
      javascript = { "javascriptreact" },
    },
  },

  -- Modify which-key registration
  ["which-key"] = {
    -- Add bindings
    register_mappings = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- which-key registration table for normal mode, leader prefix
          -- ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
        },
      },
    },
  },

  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },

  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without lsp-installer
    servers = {
      -- "pyright"
    },
    -- add to the server on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the lsp installer server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server].setup(opts)
    -- end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = {
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({}))
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  -- This function is run last
  -- good place to configure mappings and vim options
  polish = function()
    -- Set key bindings
    vim.keymap.set("n", "<C-s>", ":w!<CR>")

    -- vim.o.guifont = "FiraCode Nerd Font Mono:h16"
    vim.o.guifont = "JetbrainsMono Nerd Font Mono:h16"

    vim.api.nvim_set_keymap('n', '<leader>fs', ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})

    -- vim.o.guifont = "Hack Nerd Font Mono"

    vim.wo.colorcolumn = '120'
    -- Set autocommands
    vim.api.nvim_create_augroup("packer_conf", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Sync packer after modifying plugins.lua",
      group = "packer_conf",
      pattern = "plugins.lua",
      command = "source <afile> | PackerSync",
    })

    vim.fn.matchadd('errorMsg', [[\s\+$]])

    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      pattern = { "*" },
      command = [[%s/\s\+$//e]],
    })

    local nvim_lsp = require('lspconfig')
    nvim_lsp.solargraph.setup {
      cmd = {
        "bundle",
        "exec",
        "solargraph",
        "stdio"
      },
      filetypes = {
        "ruby"
      },
      flags = {
        debounce_text_changes = 150
      },
      root_dir = nvim_lsp.util.root_pattern("Gemfile", ".git", "."),
      settings = {
        solargraph = {
          autoformat = true,
          completion = true,
          diagnostic = true,
          folding = true,
          references = true,
          rename = true,
          symbols = true
        }
      }
    }
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}

return config
