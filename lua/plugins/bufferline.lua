return {
    "akinsho/bufferline.nvim",
    config = function()
        vim.o.mousemoveevent = true
        vim.opt.termguicolors = true

        local bufferline = require("bufferline")

        bufferline.setup({
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
        })
    end,
}
