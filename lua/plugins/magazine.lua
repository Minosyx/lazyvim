return {
    {
        "iguanacucumber/magazine.nvim",
        name = "nvim-cmp",
        opts = function(_, opts)
            local cmp = require("cmp")
            local types = require("cmp.types")

            opts.preselect = types.cmp.PreselectMode.None
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

    "https://codeberg.org/FelipeLema/cmp-async-path",
}
