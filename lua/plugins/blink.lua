return {
    "saghen/blink.cmp",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "xzbdmw/colorful-menu.nvim",
        "fang2hou/blink-copilot",
    },
    version = "1.*",
    opts = {
        snippets = { preset = "mini_snippets" },
        sources = {
            default = { "copilot" },
            providers = {
                copilot = {
                    name = "copilot",
                    module = "blink-copilot",
                    score_offset = 100,
                    async = true,
                },
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
                    columns = { { "kind_icon" }, { "label", gap = 1 }, { "kind" } },
                    components = {
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
