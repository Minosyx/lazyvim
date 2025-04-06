return {
    "sindrets/diffview.nvim",
    config = function()
        Snacks.toggle({
            name = "Toggle Diffview",
            get = function()
                return require("diffview.lib").get_current_view() ~= nil
            end,
            set = function(state)
                if state then
                    vim.cmd("DiffviewOpen")
                else
                    vim.cmd("DiffviewClose")
                end
            end,
        }):map("<leader>gD")
    end,
}
