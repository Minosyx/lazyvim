return {
    "saghen/blink.cmp",
    dependencies = {
        "onsails/lspkind.nvim",
        "nvim-tree/nvim-web-devicons",
        "xzbdmw/colorful-menu.nvim",
        "fang2hou/blink-copilot",
    },
    version = "1.*",
    opts = {
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
                max_height = 20,
                border = "rounded",
                winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None,CursorLine:PmenuSel",
                draw = {
                    columns = { { "kind_icon" }, { "label", gap = 1 }, { "kind" } },
                    components = {
                        kind_icon = {
                            text = function(ctx)
                                local lspkind = require("lspkind")
                                local icon = ctx.kind_icon
                                local source_name = ctx.source_name

                                -- 1. Check for Copilot source explicitly
                                if source_name == "copilot" then
                                    icon = "✦"

                                -- 2. Check for Path source
                                elseif vim.tbl_contains({ "Path" }, ctx.source_name) then
                                    local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                                    if dev_icon then
                                        icon = dev_icon
                                    end
                                else
                                    icon = require("lspkind").symbolic(ctx.kind, {
                                        mode = "symbol",
                                    })
                                end
                                return icon .. ctx.icon_gap
                            end,

                            highlight = function(ctx)
                                local hl = ctx.kind_hl
                                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                                    local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                                    if dev_icon then
                                        hl = dev_hl
                                    end
                                end
                                return hl
                            end,
                        },
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
                    winhighlight = "Normal:Pmenu,FloatBorder:Pmenu",
                },
            },
        },
        signature = {
            enabled = true,
            window = {
                border = "rounded",
                winhighlight = "Normal:Pmenu,FloatBorder:Pmenu",
                show_documentation = false,
            },
        },
    },
}
