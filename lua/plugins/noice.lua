return {
    "folke/noice.nvim",
    opts = {
        presets = { lsp_doc_border = true },
        views = { hover = { win_options = { winhighlight = "Normal:Pmenu,FloatBorder:Pmenu" } } },
        routes = {
            {
                opts = { skip = true },
                filter = {
                    event = "notify",
                    find = "^kotlin_language_server: %-32603: Internal error%.$",
                },
            },
        },
    },
}
