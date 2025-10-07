return {
    "EdenEast/nightfox.nvim",
    "rebelot/kanagawa.nvim",
    "philosofonusus/morta.nvim",
    "Shatur/neovim-ayu",
    "rose-pine/neovim",
    "tiagovla/tokyodark.nvim",
    {
        "olimorris/onedarkpro.nvim",
        opts = function(_, opts)
            opts.highlights = {
                ["@variable"] = { fg = "#BF6289" },
                ["@parameter"] = { fg = "#BF6289" },
                ["@number"] = { fg = "#56837E" },
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
        end,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "onedark_dark",
        },
    },
}
