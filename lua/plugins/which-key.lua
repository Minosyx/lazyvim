return {
    "folke/which-key.nvim",
    opts = {
        icons = {
            rules = {
                { pattern = "ai", icon = "✦", color = "cyan" },
                { pattern = "jujutsu", icon = "⚔️", color = "blue" },
                { plugin = "CopilotChat.nvim", icon = "✦", color = "green" },
            },
        },
    },
    keys = {
        {
            "<leader>j",
            function()
                require("which-key").show({ global = true })
            end,
            desc = "Jujutsu",
        },
    },
}
