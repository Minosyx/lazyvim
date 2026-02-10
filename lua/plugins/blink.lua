return {
    "saghen/blink.cmp",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "xzbdmw/colorful-menu.nvim",
        "fang2hou/blink-copilot",
        "nvim-mini/mini.snippets",
    },
    version = "*",
    ---@type blink.cmp.Config
    opts = {
        snippets = { preset = "mini_snippets", score_offset = 5 },
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
            implementation = "prefer_rust_with_warning",
            sorts = {
                "exact",
                "score",
                "sort_text",
            },
        },
        keymap = {
            preset = "enter",
            ["<C-j>"] = { "select_next", "fallback_to_mappings" },
            ["<C-k>"] = { "select_prev", "fallback_to_mappings" },
            ["<C-n>"] = { "show_signature", "hide_signature", "fallback" },
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
                                elseif vim.tbl_contains({ "Path" }, ctx.source_name) then
                                    local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                                    if dev_icon then
                                        kind_icon = dev_icon
                                    end
                                else
                                    kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                                end
                                return kind_icon .. ctx.icon_gap
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
                draw = function(opts)
                    if opts.item and opts.item.documentation and opts.item.documentation.value then
                        local out = require("pretty_hover.parser").parse(opts.item.documentation.value)
                        opts.item.documentation.value = out:string()
                    end
                    opts.default_implementation(opts)
                end,
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
