return {
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        opts = function(_, opts)
            local logo = [[
***
* NVIM *
***
            ]]
            logo = string.rep("\n", 2) .. logo .. "\n \n"

            opts.config = opts.config or {} -- Ensure opts.config exists
            opts.config.header = vim.split(logo, "\n")
        end,
    },
}
