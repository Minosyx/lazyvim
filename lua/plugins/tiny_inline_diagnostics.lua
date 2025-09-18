return {
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy",
        priority = 1000,
        opts = {
            hi = {
                background = "#1D1E1F",
            },
            preset = "modern",
            options = {
                add_messages = false,
                multilines = true,
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        opts = { diagnostics = { virtual_text = false } },
    },
}
