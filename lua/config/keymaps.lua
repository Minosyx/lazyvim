-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>gD", function()
    local diffview = require("diffview.lib")
    vim.cmd(diffview.get_current_view() and "DiffviewClose" or "DiffviewOpen")
end, { desc = "Toggle Diffview" })
