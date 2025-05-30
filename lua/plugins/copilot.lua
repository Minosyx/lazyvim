return {
    "zbirenbaum/copilot.lua",
    optional = true,
    cmd = "Copilot",
    event = "InsertEnter",
    opts = function(opts)
        require("copilot.api").status = require("copilot.status")
        return {
            suggestion = { enabled = false },
            panel = { enabled = false },
            filetypes = {
                markdown = true,
                help = true,
            },
        }
    end,
    config = function()
        Snacks.toggle({
            name = "Toggle Copilot",
            get = function()
                if not vim.g.copilot_enabled then
                    return false
                end
                return not require("copilot.client").is_disabled()
            end,
            set = function(state)
                if state then
                    require("copilot").setup()
                    require("copilot.command").enable()
                    vim.g.copilot_enabled = true
                else
                    require("copilot.command").disable()
                    vim.g.copilot_enabled = false
                end
            end,
        }):map("<leader>ae")
    end,
}
