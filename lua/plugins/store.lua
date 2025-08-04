return {
    "alex-popov-tech/store.nvim",
    dependencies = {
        "OXY2DEV/markview.nvim", -- optional, for pretty readme preview / help window
    },
    cmd = "Store",
    keys = {},
    opts = {
        width = 0.9,
        height = 0.9,

        proportions = {
            list = 0.3,
            preview = 0.7,
        },
    },
}
