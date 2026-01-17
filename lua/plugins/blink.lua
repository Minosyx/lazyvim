return {
    "saghen/blink.cmp",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "xzbdmw/colorful-menu.nvim",
        "fang2hou/blink-copilot",
    },
    version = "1.*",
    ---@type blink.cmp.Config
    opts = {
        snippets = { preset = "mini_snippets" },
        sources = {
            default = { "copilot", "lsp", "buffer", "snippets", "path" },
            providers = {
                copilot = {
                    name = "copilot",
                    module = "blink-copilot",
                    score_offset = 100,
                    async = true,
                },
            },
        },
        fuzzy = {
            sorts = {
                "exact",
                "score",
                "sort_text",
            },
        },
        keymap = {
            preset = "super-tab",
            ["<C-1>"] = {
                function(cmp)
                    cmp.accept({ index = 1 })
                end,
            },
            ["<C-2>"] = {
                function(cmp)
                    cmp.accept({ index = 2 })
                end,
            },
            ["<C-3>"] = {
                function(cmp)
                    cmp.accept({ index = 3 })
                end,
            },
            ["<C-4>"] = {
                function(cmp)
                    cmp.accept({ index = 4 })
                end,
            },
            ["<C-5>"] = {
                function(cmp)
                    cmp.accept({ index = 5 })
                end,
            },
            ["<C-6>"] = {
                function(cmp)
                    cmp.accept({ index = 6 })
                end,
            },
            ["<C-7>"] = {
                function(cmp)
                    cmp.accept({ index = 7 })
                end,
            },
            ["<C-8>"] = {
                function(cmp)
                    cmp.accept({ index = 8 })
                end,
            },
            ["<C-9>"] = {
                function(cmp)
                    cmp.accept({ index = 9 })
                end,
            },
            ["<C-0>"] = {
                function(cmp)
                    cmp.accept({ index = 10 })
                end,
            },
        },
        completion = {
            list = {
                selection = {
                    preselect = true,
                    auto_insert = false,
                },
            },
            menu = {
                max_height = 30,
                border = "rounded",
                winhighlight = "Search:None,CursorLine:PmenuSel",
                draw = {
                    columns = { { "item_idx" }, { "kind_icon" }, { "label", gap = 1 }, { "kind" } },
                    components = {
                        item_idx = {
                            text = function(ctx)
                                return ctx.idx == 10 and "0" or ctx.idx >= 10 and " " or tostring(ctx.idx)
                            end,
                            highlight = "BlinkCmpItemIdx",
                        },
                        kind_icon = {
                            text = function(ctx)
                                local kind_icon = ctx.kind_icon
                                local source_name = ctx.source_name

                                if source_name == "copilot" then
                                    kind_icon = "✦"

                                -- elseif vim.tbl_contains({ "Path" }, ctx.source_name) then
                                --     local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                                --     if dev_icon then
                                --         icon = dev_icon
                                --     end
                                else
                                    kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                                end
                                return kind_icon .. ctx.icon_gap
                            end,

                            -- highlight = function(ctx)
                            --     local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                            --     return hl
                            -- end,
                        },
                        -- kind = {
                        --     highlight = function(ctx)
                        --         local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                        --         return hl
                        --     end,
                        -- },
                        label = {
                            text = function(ctx)
                                return require("colorful-menu").blink_components_text(ctx)
                            end,
                            highlight = function(ctx)
                                return require("colorful-menu").blink_components_highlight(ctx)
                            end,
                        },
                    },
                },
            },
            documentation = {
                window = {
                    border = "rounded",
                },
            },
        },
        signature = {
            enabled = true,
            window = {
                border = "rounded",
                show_documentation = false,
            },
        },
    },
}
