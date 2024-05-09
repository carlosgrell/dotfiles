return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        -- Recommended - see "Configuring" below for more config options
        transparent = true,
        italic_comments = true,
        hide_fillchars = true,
        borderless_telescope = false,
        terminal_colors = true,
      })
      -- vim.cmd("colorscheme cyberdream") -- set the colorscheme

      local telescope = require("telescope")
      local actions = require("telescope.actions")

      -- Get current theme colours
      local get_hlgroup = require("astroui").get_hlgroup
      local normal = get_hlgroup("Normal")
      local fg, bg = normal.fg, "none"
      local bg_alt = "none"
      local green = get_hlgroup("String").fg
      local red = get_hlgroup("Error").fg

      -- Create table of colours for telescope for pretty borderless theme
      local telescope_colours = {
        TelescopeBorder = { fg = bg_alt, bg = bg },
        TelescopeNormal = { bg = bg },
        TelescopePreviewBorder = { fg = bg, bg = bg },
        TelescopePreviewNormal = { bg = bg },
        TelescopePreviewTitle = { fg = bg, bg = bg },
        TelescopePromptBorder = { fg = bg_alt, bg = bg_alt },
        TelescopePromptNormal = { fg = fg, bg = bg_alt },
        TelescopePromptPrefix = { fg = red, bg = bg_alt },
        TelescopePromptTitle = { fg = bg, bg = bg },
        TelescopeResultsBorder = { fg = bg, bg = bg },
        TelescopeResultsNormal = { bg = bg },
        TelescopeResultsTitle = { fg = bg, bg = bg },
      }

      -- Apply colours to telescope
      for hlgroup, colours in pairs(telescope_colours) do
        vim.api.nvim_set_hl(0, hlgroup, colours)
      end

      telescope.setup({
        pickers = {
          colorscheme = {
            enable_preview = true,
          },
          find_files = {
            file_ignore_patterns = { ".git%p" },
            hidden = true,
          },
        },
        defaults = {
          prompt_prefix = "   ",
          selection_caret = "  ",
          entry_prefix = "  ",

          sorting_strategy = "ascending",
          layout_strategy = "horizontal",

          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          path_display = { "truncate " },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous, -- move to prev result
              ["<C-j>"] = actions.move_selection_next, -- move to next result
              --["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
          },
        },
      })
      vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none", ctermbg = "none" })
      -- Set the background of the tabline to be transparent
      vim.api.nvim_set_hl(0, "BufferTabpageFill", { bg = "none", ctermbg = "none" })
      vim.api.nvim_set_hl(0, "BufferTabpageSel", { bg = "none", ctermbg = "none" })
      vim.api.nvim_set_hl(0, "BufferTabpageSelTarget", { bg = "none", ctermbg = "none" })
      vim.cmd [[
        highlight TabLine guibg=none
        highlight TabLineFill guibg=none
        highlight TabLineSel guibg=none
      ]]
    end,
  }
}
