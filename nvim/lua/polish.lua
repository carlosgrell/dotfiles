
-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
vim.filetype.add {
  extension = {
    foo = "fooscript",
  },
  filename = {
    ["Foofile"] = "fooscript",
  },
  pattern = {
    ["~/%.config/foo/.*"] = "fooscript",
  },
}


require("lightspeed")


local null_ls = require("null-ls")

-- Function to restart null-ls
local function restart_null_ls()
    print("Restarting null-ls...")
    null_ls.restart()
end

-- Autocommand to monitor LSP disconnections
vim.api.nvim_create_autocmd("LspDetach", {
    pattern = "*",  -- Applies to all buffers
    callback = function(args)
        -- Check if the detached LSP is related to null-ls managed LSPs
        if args.data and args.data.client_id then
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if client and client.name == "null-ls" then
                restart_null_ls()
            end
        end
    end
})
