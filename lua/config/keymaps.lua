-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local isInstalled, _ = pcall(require, "undo-glow")
if isInstalled then
    local uglow = require("undo-glow")
    -- Yanky Related keymaps
    vim.keymap.set({ "n", "x" }, "p", function()
        return uglow.yanky_put("YankyPutAfter")
    end, { noremap = true, desc = "Put yanked text after cursor", expr = true })

    vim.keymap.set({ "n", "x" }, "P", function()
        return uglow.yanky_put("YankyPutBefore")
    end, { noremap = true, desc = "Put yanked text before cursor", expr = true })

    vim.keymap.set({ "n", "x" }, "gp", function()
        return uglow.yanky_put("YankyGPutAfter")
    end, { noremap = true, desc = "Put yanked text after selection", expr = true })

    vim.keymap.set({ "n", "x" }, "gP", function()
        return uglow.yanky_put("YankyGPutBefore")
    end, { noremap = true, desc = "Put yanked text before selection", expr = true })

    vim.keymap.set("n", "]p", function()
        return uglow.yanky_put("YankyPutIndentAfterLinewise")
    end, { noremap = true, desc = "Put indented after cursor (linewise)", expr = true })

    vim.keymap.set("n", "[p", function()
        return uglow.yanky_put("YankyPutIndentBeforeLinewise")
    end, { noremap = true, desc = "Put indented before cursor (linewise)", expr = true })

    vim.keymap.set("n", "]P", function()
        return uglow.yanky_put("YankyPutIndentAfterLinewise")
    end, { noremap = true, desc = "Put indented after cursor (linewise)", expr = true })

    vim.keymap.set("n", "[P", function()
        return uglow.yanky_put("YankyPutIndentBeforeLinewise")
    end, { noremap = true, desc = "Put indented before cursor (linewise)", expr = true })

    vim.keymap.set("n", ">p", function()
        return uglow.yanky_put("YankyPutIndentAfterShiftRight")
    end, { noremap = true, desc = "Put and indent right", expr = true })

    vim.keymap.set("n", "<p", function()
        return uglow.yanky_put("YankyPutIndentAfterShiftLeft")
    end, { noremap = true, desc = "Put and indent left", expr = true })

    vim.keymap.set("n", ">P", function()
        return uglow.yanky_put("YankyPutIndentBeforeShiftRight")
    end, { noremap = true, desc = "Put before and indent right", expr = true })

    vim.keymap.set("n", "<P", function()
        return uglow.yanky_put("YankyPutIndentBeforeShiftLeft")
    end, { noremap = true, desc = "Put before and indent left", expr = true })

    vim.keymap.set("n", "=p", function()
        return uglow.yanky_put("YankyPutAfterFilter")
    end, { noremap = true, desc = "Put after applying a filter", expr = true })

    vim.keymap.set("n", "=P", function()
        return uglow.yanky_put("YankyPutBeforeFilter")
    end, { noremap = true, desc = "Put before applying a filter", expr = true })

    vim.keymap.set({ "n", "x" }, "gc", function()
        local pos = vim.fn.getpos(".")
        vim.schedule(function()
            vim.fn.setpos(".", pos)
        end)
        return uglow.comment()
    end, { noremap = true, desc = "Toggle comment with highlight", expr = true })

    vim.keymap.set("o", "gc", function()
        uglow.comment_textobject()
    end, { noremap = true, desc = "Comment textobject with highlight" })

    vim.keymap.set("n", "gcc", function()
        return uglow.comment_line()
    end, { noremap = true, desc = "Toggle comment line with highlight", expr = true })
end

vim.keymap.set({ "o" }, "p", function()
    local path = vim.fn.expand("%:.") .. ":" .. vim.fn.line(".")
    vim.fn.setreg("+", path)
    vim.fn.setreg('"', path)
    vim.notify("Yanked: " .. path)
    return "<ESC>"
end, { noremap = true, desc = "Yank relative file path", expr = true })

vim.keymap.set({ "o" }, "P", function()
    local path = vim.fn.expand("%:p") .. ":" .. vim.fn.line(".")
    vim.fn.setreg("+", path)
    vim.fn.setreg('"', path)
    vim.notify("Yanked: " .. path)
    return "<ESC>"
end, { noremap = true, desc = "Yank absolute file path", expr = true })

vim.keymap.set("n", "<leader>fd", function()
    local cwd = vim.fn.expand("%:p:h")
    vim.cmd("cd " .. cwd)
    vim.notify("Changed cwd to: " .. cwd)
end, { noremap = true, desc = "Set cwd to current buffer directory" })

isInstalled, _ = pcall(require, "jj")
if isInstalled then
    -- Jujutsu keymaps
    -- Core commands
    local cmd = require("jj.cmd")
    vim.keymap.set("n", "<leader>jd", cmd.describe, { desc = "JJ describe" })
    vim.keymap.set("n", "<leader>jl", cmd.log, { desc = "JJ log" })
    vim.keymap.set("n", "<leader>je", cmd.edit, { desc = "JJ edit" })
    vim.keymap.set("n", "<leader>jn", cmd.new, { desc = "JJ new" })
    vim.keymap.set("n", "<leader>js", cmd.status, { desc = "JJ status" })
    vim.keymap.set("n", "<leader>jq", cmd.squash, { desc = "JJ squash" })
    vim.keymap.set("n", "<leader>ju", cmd.undo, { desc = "JJ undo" })
    vim.keymap.set("n", "<leader>jy", cmd.redo, { desc = "JJ redo" })
    vim.keymap.set("n", "<leader>jr", cmd.rebase, { desc = "JJ rebase" })
    vim.keymap.set("n", "<leader>jbc", cmd.bookmark_create, { desc = "JJ bookmark create" })
    vim.keymap.set("n", "<leader>jbd", cmd.bookmark_delete, { desc = "JJ bookmark delete" })
    vim.keymap.set("n", "<leader>jbm", cmd.bookmark_move, { desc = "JJ bookmark move" })
    vim.keymap.set("n", "<leader>ja", cmd.abandon, { desc = "JJ abandon" })
    vim.keymap.set("n", "<leader>jf", cmd.fetch, { desc = "JJ fetch" })
    vim.keymap.set("n", "<leader>jp", cmd.push, { desc = "JJ push" })
    vim.keymap.set("n", "<leader>jpr", cmd.open_pr, { desc = "JJ open PR from bookmark in current revision or parent" })
    vim.keymap.set("n", "<leader>jpl", function()
        cmd.open_pr({ list_bookmarks = true })
    end, { desc = "JJ open PR listing available bookmarks" })

    -- Diff commands
    local diff = require("jj.diff")
    vim.keymap.set("n", "<leader>jif", function()
        diff.open_vdiff()
    end, { desc = "JJ diff current buffer" })
    vim.keymap.set("n", "<leader>jiF", function()
        diff.open_hdiff()
    end, { desc = "JJ hdiff current buffer" })

    -- Pickers
    local picker = require("jj.picker")
    vim.keymap.set("n", "<leader>jgs", function()
        picker.status()
    end, { desc = "JJ Picker status" })
    vim.keymap.set("n", "<leader>jgh", function()
        picker.file_history()
    end, { desc = "JJ Picker history" })

    -- Some functions like `log` can take parameters
    vim.keymap.set("n", "<leader>jL", function()
        cmd.log({
            revisions = "'all()'", -- equivalent to jj log -r ::
        })
    end, { desc = "JJ log all" })

    -- This is an alias i use for moving bookmarks its so good
    vim.keymap.set("n", "<leader>jt", function()
        cmd.j("tug")
        cmd.log({})
    end, { desc = "JJ tug" })
end
