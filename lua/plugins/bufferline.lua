return {
    "akinsho/bufferline.nvim",
    init = function()
        vim.o.mousemoveevent = true
    end,
    opts = {
        options = {
            hover = {
                enabled = true,
                delay = 100,
                reveal = { "close" },
            },
            always_show_bufferline = false,
            indicator = {
                style = "icon",
            },
        },
    },
}
