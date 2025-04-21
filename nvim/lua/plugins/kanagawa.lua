return {
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    config = function()
      require('kanagawa').setup({
        compile = true,             -- enable compiling the colorscheme
        undercurl = false,            -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = true,         -- do not set background color
        dimInactive = true,         -- dim inactive window `:h hl-NormalNC`
        terminalColors = true,       -- define vim.g.terminal_color_{0,17}
        colors = {                   -- add/modify theme and palette colors
          palette = {
            samuraiRed = "#e49ca0", -- already pastel
            -- autumnRed = "#e49ca0",
           --  peachRed = "#e49ca0",
            -- surimiOrange = "#e49ca0", -- orange-red
            sakuraPink = "#e49ca0",   -- already pastel
          },
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors) -- add/modify highlights
          return {}
        end,
        theme = "wave",              -- Load "wave" theme when 'background' option is not set
        background = {               -- map the value of 'background' option to a theme
          dark = "wave",           -- try "dragon" !
          light = "lotus"
        },
      })

      vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#f57ce9" })
    end,
  },
}
