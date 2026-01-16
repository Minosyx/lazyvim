return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    -- @type PluginLspOpts
    opts = {
        diagnostics = {
            float = {
                border = "rounded",
            },
        },
        servers = {
            copilot = {
                enabled = false,
            },
        },
    },

    init = function()
        local copilot_enabled = vim.lsp.is_enabled("copilot")

        vim.keymap.set("n", "<leader>ae", function()
            copilot_enabled = not copilot_enabled
            if copilot_enabled then
                vim.cmd("lsp enable copilot")
                vim.notify("Copilot LSP enabled")
            else
                vim.cmd("lsp disable copilot")
                vim.notify("Copilot LSP disabled")
            end
        end, { desc = "Toggle Copilot" })
    end,
}
