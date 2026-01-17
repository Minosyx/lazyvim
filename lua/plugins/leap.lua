local function ft(key_specific_args)
    require("leap").leap(vim.tbl_deep_extend("keep", key_specific_args, {
        inputlen = 1,
        inclusive = true,
        opts = {
            -- Force autojump.
            labels = "",
            -- Match the modes where you don't need labels (`:h mode()`).
            safe_labels = vim.fn.mode(1):match("o") and "" or nil,
        },
    }))
end

local clever = require("leap.user").with_traversal_keys
local clever_f, clever_t = clever("f", "F"), clever("t", "T")
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
            {
                "f",
                function()
                    ft({ opts = clever_f })
                end,
                mode = { "n", "x", "o" },
                desc = "Move to next char",
            },
            {
                "F",
                function()
                    ft({ backward = true, opts = clever_f })
                end,
                mode = { "n", "x", "o" },
                desc = "Move to prev char",
            },
            {
                "t",
                function()
                    ft({ offset = -1, opts = clever_t })
                end,
                mode = { "n", "x", "o" },
                desc = "Move before next char",
            },
            {
                "T",
                function()
                    ft({ backward = true, offset = 1, opts = clever_f })
                end,
                mode = { "n", "x", "o" },
                desc = "Move before prev char",
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
