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

                Visual = { bg = "#404754" },
            }
            opts.colors = {
                cursorline = "#1d1e1f",
            }
            opts.options = {
                cursorline = true,
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
