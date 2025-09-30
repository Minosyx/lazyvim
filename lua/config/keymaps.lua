-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Yanky Related keymaps
vim.keymap.set({ "n", "x" }, "p", function()
    return require("undo-glow").yanky_put("YankyPutAfter")
end, { noremap = true, desc = "Put yanked text after cursor", expr = true })

vim.keymap.set({ "n", "x" }, "P", function()
    return require("undo-glow").yanky_put("YankyPutBefore")
end, { noremap = true, desc = "Put yanked text before cursor", expr = true })

vim.keymap.set({ "n", "x" }, "gp", function()
    return require("undo-glow").yanky_put("YankyGPutAfter")
end, { noremap = true, desc = "Put yanked text after selection", expr = true })

vim.keymap.set({ "n", "x" }, "gP", function()
    return require("undo-glow").yanky_put("YankyGPutBefore")
end, { noremap = true, desc = "Put yanked text before selection", expr = true })

vim.keymap.set("n", "]p", function()
    return require("undo-glow").yanky_put("YankyPutIndentAfterLinewise")
end, { noremap = true, desc = "Put indented after cursor (linewise)", expr = true })

vim.keymap.set("n", "[p", function()
    return require("undo-glow").yanky_put("YankyPutIndentBeforeLinewise")
end, { noremap = true, desc = "Put indented before cursor (linewise)", expr = true })

vim.keymap.set("n", "]P", function()
    return require("undo-glow").yanky_put("YankyPutIndentAfterLinewise")
end, { noremap = true, desc = "Put indented after cursor (linewise)", expr = true })

vim.keymap.set("n", "[P", function()
    return require("undo-glow").yanky_put("YankyPutIndentBeforeLinewise")
end, { noremap = true, desc = "Put indented before cursor (linewise)", expr = true })

vim.keymap.set("n", ">p", function()
    return require("undo-glow").yanky_put("YankyPutIndentAfterShiftRight")
end, { noremap = true, desc = "Put and indent right", expr = true })

vim.keymap.set("n", "<p", function()
    return require("undo-glow").yanky_put("YankyPutIndentAfterShiftLeft")
end, { noremap = true, desc = "Put and indent left", expr = true })

vim.keymap.set("n", ">P", function()
    return require("undo-glow").yanky_put("YankyPutIndentBeforeShiftRight")
end, { noremap = true, desc = "Put before and indent right", expr = true })

vim.keymap.set("n", "<P", function()
    return require("undo-glow").yanky_put("YankyPutIndentBeforeShiftLeft")
end, { noremap = true, desc = "Put before and indent left", expr = true })

vim.keymap.set("n", "=p", function()
    return require("undo-glow").yanky_put("YankyPutAfterFilter")
end, { noremap = true, desc = "Put after applying a filter", expr = true })

vim.keymap.set("n", "=P", function()
    return require("undo-glow").yanky_put("YankyPutBeforeFilter")
end, { noremap = true, desc = "Put before applying a filter", expr = true })

vim.keymap.set({ "n", "x" }, "gc", function()
    local pos = vim.fn.getpos(".")
    vim.schedule(function()
        vim.fn.setpos(".", pos)
    end)
    return require("undo-glow").comment()
end, { noremap = true, desc = "Toggle comment with highlight", expr = true })

vim.keymap.set("o", "gc", function()
    require("undo-glow").comment_textobject()
end, { noremap = true, desc = "Comment textobject with highlight" })

vim.keymap.set("n", "gcc", function()
    return require("undo-glow").comment_line()
end, { noremap = true, desc = "Toggle comment line with highlight", expr = true })
