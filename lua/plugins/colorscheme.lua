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
                ["@variable"] = { fg = "#E18254" },
                ["@parameter"] = { fg = "#E18254" },

                Visual = { bg = "#404754" },
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
