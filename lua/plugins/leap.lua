return {
    {
        "https://codeberg.org/andyg/leap.nvim",
        keys = {
            { "s", "<Plug>(leap-forward)", mode = { "n", "x", "o" }, desc = "Leap forward to" },
            { "S", "<Plug>(leap-backward)", mode = { "n", "x", "o" }, desc = "Leap backward to" },
            { "gs", "<Plug>(leap-from-window)", mode = { "n" }, desc = "Leap from window" },
            {
                "R",
                function()
                    require("leap.treesitter").select({
                        opts = require("leap.user").with_traversal_keys("R", "r"),
                    })
                end,
                mode = { "x", "o" },
                desc = "Leap with treesitter traversal",
            },
            {
                "gl",
                function()
                    require("leap.remote").action()
                end,
                mode = { "n" },
                desc = "Remote operation",
            },
        },
        config = function(_, opts)
            opts = { "setup" }
            require("leap").opts.equivalence_classes = { " \t\r\n", "([{", ")]}", "'\"`" }
            return opts
        end,
    },
    {
        "rasulomaroff/telepath.nvim",
        dependencies = "https://codeberg.org/andyg/leap.nvim",
        keys = {
            {
                "gl",
                function()
                    require("telepath").remote({
                        restore = true,
                    })
                end,
                mode = { "o" },
                desc = "Remote operation",
            },
        },
    },
}
