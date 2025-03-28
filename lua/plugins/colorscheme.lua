return {
    "EdenEast/nightfox.nvim",
    "rebelot/kanagawa.nvim",
    "philosofonusus/morta.nvim",
    "Shatur/neovim-ayu",
    "rose-pine/neovim",
    "tiagovla/tokyodark.nvim",
    {
        "olimorris/onedarkpro.nvim",
        config = function(_, opts)
            require("onedarkpro").setup(vim.tbl_deep_extend("force", opts, {
                highlights = {
                    ["@variable"] = { fg = "#E18254" },
                    ["@parameter"] = { fg = "#E18254" },

                    Visual = { bg = "#404754" },
                },
            }))
        end,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "onedark_dark",
        },
    },
}
