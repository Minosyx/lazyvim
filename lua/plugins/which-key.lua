return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        icons = {
            rules = {
                { pattern = "ai", icon = "✦", color = "cyan" },
                { pattern = "jujutsu", icon = "⚔️", color = "blue" },
                { plugin = "CopilotChat.nvim", icon = "✦", color = "green" },
            },
        },
        spec = {
            { "gF", group = "Go to file and line under cursor" },
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
