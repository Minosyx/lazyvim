return {
    "y3owk1n/undo-glow.nvim",
    dependencies = {
        "gbprod/yanky.nvim",
        "folke/snacks.nvim",
    },
    event = { "VeryLazy" },
    ---@type UndoGlow.Config
    opts = {
        animation = {
            enabled = true,
            duration = 300,
            animation_type = "zoom",
            window_scoped = true,
        },
        highlights = {
            undo = {
                hl_color = { bg = "#693232" }, -- Dark muted red
            },
            redo = {
                hl_color = { bg = "#2F4640" }, -- Dark muted green
            },
            yank = {
                hl_color = { bg = "#7A683A" }, -- Dark muted yellow
            },
            paste = {
                hl_color = { bg = "#325B5B" }, -- Dark muted cyan
            },
            search = {
                hl_color = { bg = "#5C475C" }, -- Dark muted purple
            },
            comment = {
                hl_color = { bg = "#7A5A3D" }, -- Dark muted orange
            },
            cursor = {
                hl_color = { bg = "#793D54" }, -- Dark muted pink
            },
        },
        priority = 2048 * 3,
    },
    keys = {
        {
            "u",
            function()
                require("undo-glow").undo()
            end,
            mode = "n",
            desc = "Undo with highlight",
            noremap = true,
        },
        {
            "<C-r>",
            function()
                require("undo-glow").redo()
            end,
            mode = "n",
            desc = "Redo with highlight",
            noremap = true,
        },
        -- WARN: Below code does not work at the moment. I don't really know why, but maybe LazyVim has something to play there.
        -- {
        --     "p",
        --     function()
        --         require("undo-glow").yanky_put("YankyPutAfter")
        --     end,
        --     mode = { "n", "x" },
        --     desc = "Paste below with highlight",
        --     expr = true,
        --     noremap = true,
        -- },
        -- {
        --     "P",
        --     function()
        --         require("undo-glow").yanky_put("YankyPutBefore")
        --     end,
        --     mode = { "n", "x" },
        --     desc = "Paste above with highlight",
        --     expr = true,
        --     noremap = true,
        -- },
        {
            "s",
            function()
                require("undo-glow").flash_jump()
            end,
            mode = { "n", "x", "o" },
            desc = "Leap Forward to",
            noremap = true,
        },
        {
            "S",
            function()
                require("undo-glow").flash_jump()
            end,
            mode = { "n", "x", "o" },
            desc = "Leap Backward to",
            noremap = true,
        },
        -- WARN: Below code does not work possibly becouse of mini.comment package.
        -- {
        --     "gc",
        --     function()
        --         -- This is an implementation to preserve the cursor position
        --         local pos = vim.fn.getpos(".")
        --         vim.schedule(function()
        --             vim.fn.setpos(".", pos)
        --         end)
        --         return require("undo-glow").comment()
        --     end,
        --     mode = { "n", "x" },
        --     desc = "Toggle comment with highlight",
        --     expr = true,
        --     noremap = true,
        -- },
        -- {
        --     "gc",
        --     function()
        --         require("undo-glow").comment_textobject()
        --     end,
        --     mode = "o",
        --     desc = "Comment textobject with highlight",
        --     noremap = true,
        -- },
        -- {
        --     "gcc",
        --     function()
        --         return require("undo-glow").comment_line()
        --     end,
        --     mode = "n",
        --     desc = "Toggle comment line with highlight",
        --     expr = true,
        --     noremap = true,
        -- },
    },
    init = function()
        -- WARN: Commented out since Pasting does not work at the moment.
        -- vim.api.nvim_create_autocmd("TextYankPost", {
        --     desc = "Highlight when yanking (copying) text",
        --     callback = function()
        --         require("undo-glow").yank()
        --     end,
        -- })

        -- This only handles neovim instance and do not highlight when switching panes in tmux
        vim.api.nvim_create_autocmd("CursorMoved", {
            desc = "Highlight when cursor moved significantly",
            callback = function()
                require("undo-glow").cursor_moved({
                    animation = {
                        animation_type = "slide",
                    },
                })
            end,
        })
    end,
}
