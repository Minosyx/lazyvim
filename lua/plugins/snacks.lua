local function set_fullscreen_for_sources(sources_list, value)
    local sources_table = {}

    for _, source in ipairs(sources_list) do
        sources_table[source] = {
            layout = {
                fullscreen = value,
            },
        }
    end

    return sources_table
end
local fullscreen_pickers = {
    "autocmds",
    "buffers",
    "diagnostics",
    "files",
    "git_diff",
    "git_files",
    "git_grep",
    "git_log",
    "git_log_file",
    "git_log_line",
    "git_stash",
    "git_status",
    "grep",
    "grep_buffers",
    "grep_word",
    "help",
    "jumps",
    "keymaps",
    "lazy",
    "loclist",
    "lsp_config",
    "lsp_declarations",
    "lsp_definitions",
    "lsp_implementations",
    "lsp_references",
    "lsp_symbols",
    "lsp_type_definitions",
    "lsp_workspace_symbols",
    "man",
    "marks",
    "noice",
    "notifications",
    "recent",
    "registers",
    "smart",
    "todo_comments",
    "treesitter",
}

return {
    "snacks.nvim",

    opts = {
        picker = {
            sources = set_fullscreen_for_sources(fullscreen_pickers, true),
        },
        image = {
            force = true,
        },
        words = {},
        animate = {
            fps = 240,
        },
    },
}
