return {
    {
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
        },
        init = function()
            vim.api.nvim_create_autocmd("TextYankPost", {
                desc = "Highlight when yanking (copying) text",
                callback = function()
                    if vim.v.operator == "y" then
                        require("undo-glow").yank()
                    end
                end,
            })

            -- This only handles neovim instance and do not highlight when switching panes in tmux
            vim.api.nvim_create_autocmd("CursorMoved", {
                desc = "Highlight when cursor moved significantly",
                callback = function()
                    require("undo-glow").cursor_moved({
                        animation = {
                            animation_type = "slide",
                            duration = 800,
                        },
                    })
                end,
            })
        end,
    },
}
