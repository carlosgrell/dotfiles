
-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "HiPhish/rainbow-delimiters.nvim" },
  opts = function(_, opts)
    opts.rainbow = {
      enable = true,
      query = "rainbow-parens",
      strategy = require("rainbow-delimiters").strategy.global,
    }

    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "lua",
      "vim",
      -- add more arguments for adding more treesitter parsers
    })
  end,
}

