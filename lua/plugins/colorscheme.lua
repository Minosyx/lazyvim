return {
    "EdenEast/nightfox.nvim",
    "rebelot/kanagawa.nvim",
    "philosofonusus/morta.nvim",
    "Shatur/neovim-ayu",
    "rose-pine/neovim",
    "tiagovla/tokyodark.nvim",
    {
        "olimorris/onedarkpro.nvim",
        lazy = false,
        priority = 1000,
        opts = function(_, opts)
            opts.highlights = {
                ["@variable"] = { fg = "#BF6289" },
                ["@parameter"] = { fg = "#BF6289" },
                ["@number"] = { fg = "#56837E" },
                ["@constant"] = { fg = "#D1AA60", bold = true },
                ["@type.builtin"] = { fg = "#A891D4", bold = true },
                ["@lsp.type.class"] = { fg = "#44BBBB", bold = true },
                Type = { fg = "#A891D4", bold = true },
                LspReferenceText = { bg = "#303030" },
                NonText = { bg = "None", fg = "#69696D" },

                Visual = { bg = "#333333" },
                LeapBackdrop = { fg = "#777777" },
                PmenuThumb = { bg = "#333333" },
                Cursor = { bg = "#00CED1" },
            }
            opts.colors = {
                cursorline = "#1D1E1F",
            }
            opts.options = {
                cursorline = true,
                transparency = true,
            }
            opts.styles = {
                types = "NONE",
                methods = "NONE",
                numbers = "NONE",
                strings = "NONE",
                comments = "NONE",
                keywords = "NONE",
                constants = "NONE",
                functions = "NONE",
                operators = "NONE",
                variables = "NONE",
                parameters = "NONE",
                conditionals = "NONE",
                virtual_text = "NONE",
            }
        end,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "onedark_dark",
        },
    },
}
