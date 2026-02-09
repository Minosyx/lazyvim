return {
    "olexsmir/gopher.nvim",
    ft = "go",
    build = function()
        vim.cmd.GoInstallDeps()
    end,
    ---@module "gopher"
    ---@type gopher.Config
    ---@diagnostic disable-next-line: missing-fields
    opts = {},
}
