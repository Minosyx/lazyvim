return {
    "y3owk1n/time-machine.nvim",
    cmd = {
        "TimeMachineToggle",
        "TimeMachinePurgeBuffer",
        "TimeMachinePurgeAll",
        "TimeMachineLogShow",
        "TimeMachineLogClear",
    },
    opts = {
        diff_tool = "difft",
        external_diff_args = {
            "--display=side-by-side-show-both",
            "--color=always",
        },
    },
    keys = {
        {
            "<leader>m",
            "",
            desc = "Time Machine",
        },
        {
            "<leader>mm",
            "<cmd>TimeMachineToggle<cr>",
            desc = "Toggle Tree",
        },
        {
            "<leader>mx",
            "<cmd>TimeMachinePurgeCurrent<cr>",
            desc = "Purge current",
        },
        {
            "<leader>mX",
            "<cmd>TimeMachinePurgeAll<cr>",
            desc = "Purge all",
        },
        {
            "<leader>ml",
            "<cmd>TimeMachineLogShow<cr>",
            desc = "Show log",
        },
    },
}
