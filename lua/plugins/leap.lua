return {
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
            "gb",
            function()
                require("leap.remote").action({
                    input = vim.fn.mode(true):match("o") and "" or "v",
                })
            end,
            mode = { "n", "o" },
            desc = "Remote operation",
        },
    },
    config = function(_, opts)
        opts = { "setup" }
        require("leap").opts.equivalence_classes = { " \t\r\n", "([{", ")]}", "'\"`" }
        return opts
    end,
}
