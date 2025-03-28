return {
    { "onsails/lspkind.nvim" },
    {
        "iguanacucumber/magazine.nvim",
        name = "nvim-cmp",
        opts = function(_, opts)
            local cmp = require("cmp")
            local types = require("cmp.types")
            local win_opt = {
                col_offset = 0,
                side_padding = 0,
                winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None,CursorLine:PmenuSel",
            }
            opts.preselect = types.cmp.PreselectMode.None
            opts.window = {
                completion = cmp.config.window.bordered(win_opt),
                documentation = cmp.config.window.bordered(win_opt),
            }
            opts.formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, vim_item)
                    local kind = require("lspkind").cmp_format({
                        mode = "symbol_text",
                        maxwidth = 50,
                        symbol_map = { Copilot = "" },
                    })(entry, vim_item)
                    local strings = vim.split(kind.kind, "%s", { trimempty = true })
                    kind.kind = " " .. (strings[1] or "") .. " "
                    kind.menu = "    (" .. (strings[2] or "") .. ")"

                    return kind
                end,
            }
            cmp.setup(opts)
        end,
    },

    {
        "iguanacucumber/mag-nvim-lsp",
        name = "cmp-nvim-lsp",
        opts = {},
    },
    { "iguanacucumber/mag-nvim-lua", name = "cmp-nvim-lua" },
    { "iguanacucumber/mag-buffer", name = "cmp-buffer" },
    { "iguanacucumber/mag-cmdline", name = "cmp-cmdline" },
    {
        "folke/noice.nvim",
        opts = {
            presets = { lsp_doc_border = true },
            views = { hover = { win_options = { winhighlight = "Normal:Pmenu,FloatBorder:Pmenu" } } },
        },
    },

    {
        "neovim/nvim-lspconfig",
        opts = {
            diagnostics = {
                float = {
                    border = "rounded",
                },
            },
        },
    },

    { "FelipeLema/cmp-async-path" },
}
