return {
  {
    "joshdick/onedark.vim",
    name = "onedark",
    opts = { },
    config = function()
      -- Check if autocommands are available and if the GUI is not running
      if vim.fn.has("autocmd") == 1 and vim.fn.has("gui_running") == 0 then
        -- Define a color table for white
        local white = { gui = "#ABB2BF", cterm = "145", cterm16 = "7" }

        -- Create an autocommand group 'colorset'
        vim.api.nvim_create_augroup('colorset', { clear = true })

        -- Setup an autocommand within the 'colorset' group
        vim.api.nvim_create_autocmd('ColorScheme', {
          group = 'colorset',
          pattern = '*',
          callback = function()
            -- Use the color 'white' for the 'Normal' highlight group's foreground
            vim.api.nvim_set_hl(0, 'Normal', { fg = white.gui })  -- Using `gui` color for both GUI and terminal
          end,
        })
      end
    end,
  },
}
