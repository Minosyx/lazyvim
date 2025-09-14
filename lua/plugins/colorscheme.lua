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
                -- ["@constant"] = { fg = "#6f8661" },
                ["@number"] = { fg = "#56837E" },
                NonText = { bg = "None", fg = "#69696D" },

                Visual = { bg = "#333333" },
                LeapBackdrop = { fg = "#777777" },
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
