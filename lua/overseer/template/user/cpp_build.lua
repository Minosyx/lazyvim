require("overseer")
---@type overseer.TemplateFileDefinition
return {
    name = "g++ build",
    params = function()
        return {
            version = {
                desc = "C++ version",
                type = "integer",
                default = 26,
            },
        }
    end,
    ---@type function
    ---@param params table Optional parameters for builder
    ---@return overseer.TaskDefinition
    builder = function(params)
        local workspace_root = vim.fn.getcwd()
        local file_dir = vim.fn.expand("%:p:h")
        local file_name_no_ext = vim.fn.expand("%:t:r")
        local outfile = file_dir .. "/" .. file_name_no_ext
        local source_files = vim.fn.glob(workspace_root .. "/*.cpp", false, true)

        local args = {
            "-fdiagnostics-color=always",
            "-g",
            "-o",
            outfile,
        }

        if params.version and params.version ~= 0 then
            table.insert(args, 1, "-std=c++" .. params.version)
        end

        for _, source in ipairs(source_files) do
            table.insert(args, source)
        end

        return {
            cmd = { "g++" },
            args = args,
            components = { { "on_output_quickfix", open = true }, "default" },
            name = "g++ build",
        }
    end,
    condition = {
        filetype = { "cpp" },
    },
}
