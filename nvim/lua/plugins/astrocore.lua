
-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = false, -- enable autopairs at start
      foldcolumn = 1,
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = false, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      i = {
        ["§"] = { 'copilot#Accept("\\<CR>")' , expr = true, desc = "Copilot Accept Line", silent = true, replace_keycodes = false },
      },
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `H` and `L`
        L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        ["<S-Right>"] = {
          function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
          desc = "Next buffer",
        },
        ["<S-Left>"] = {
          function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
          desc = "Previous buffer",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
        ["<Leader>F"] = {
          function()
            -- Execute RuboCop auto-correction for the current file
            vim.cmd('silent !rubocop -A ' .. vim.fn.shellescape(vim.fn.expand('%')))
            -- Reload the buffer to reflect changes
            vim.cmd('edit!')
          end,
          desc = "Apply RuboCop Auto-Correct to Current Buffer",
        },
        ["<Leader>fy"] = {
          function()
            -- Get the relative path of the current file
            local file_path = vim.fn.expand('%')
            -- Copy the relative path to the "+" register, which Neovim uses for the system clipboard
            vim.fn.setreg('+', file_path)
            -- Optionally, display a message confirming the action
            vim.notify('Yanked relative path: ' .. file_path, vim.log.levels.INFO)
          end,
          desc = "Yank the relative file path",
        },
        ["<Leader>fY"] = {
          function()
            -- Get the absolute path of the current file
            local file_path = vim.fn.expand('%:p')
            -- Copy the absolute path to the "+" register, which Neovim uses for the system clipboard
            vim.fn.setreg('+', file_path)
            -- Optionally, display a message confirming the action
            vim.notify('Yanked absolute path: ' .. file_path, vim.log.levels.INFO)
          end,
          desc = "Yank the absolute file path",
        },
        ["<leader>vt"] = {
          function()
            local vt = vim.diagnostic.config().virtual_text
            if vt then
              vim.diagnostic.config { virtual_text = false }
              vt = false
              vim.notify("Virtual text disabled", vim.log.levels.INFO)

            else
              vim.diagnostic.config { virtual_text = true }
              vt = true
              vim.notify("Virtual text enabled", vim.log.levels.INFO)
            end
          end,
          desc = "Toggle Virtual Text",
        },
        ["<leader>j"] = { "<cmd>:HopChar1<cr>", desc = "Hop Char 1" },
        ["§"] = { "<cmd>:HopChar1<cr>", desc = "Hop Char 1" },
        ["<BS>"] = { "<cmd>:HopChar1<cr>", desc = "Hop Char 1" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}
