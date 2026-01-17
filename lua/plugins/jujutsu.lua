return {
    {
        "Minosyx/lazyjj.nvim",
        -- this extension is not scaled properly at the moment it seems
        enabled = false,
        dependencies = "nvim-lua/plenary.nvim",
        opts = {
            col_range = 1.0,
            row_range = 1.0,
        },
    },
    {
        "nicolasgb/jj.nvim",
        dependencies = {
            "folke/snacks.nvim", -- Optional only if you use picker's
        },
        branch = "main",
        config = function()
            local jj = require("jj")
            jj.setup(
                ---@type jj.Config
                {
                    terminal = {
                        cursor_render_delay = 10, -- Adjust if cursor position isn't restoring correctly
                    },
                    cmd = {
                        describe = {
                            editor = {
                                type = "buffer",
                                keymaps = {
                                    close = { "q", "<Esc>", "<C-c>" },
                                },
                            },
                        },
                        bookmark = {
                            prefix = "feat/",
                        },
                        keymaps = {
                            log = {},
                            status = {
                                open_file = "<CR>",
                                restore_file = "<S-x>",
                            },
                            close = { "q", "<Esc>" },
                        },
                    },
                    highlights = {
                        -- Customize colors if desired
                        modified = { fg = "#89ddff" },
                    },
                }
            )
        end,
    },
}
