return {
    {
        "nvim-telescope/telescope.nvim",
        opts = {
            defaults = {
                prompt_prefix = "  ",
                selection_caret = " ",
                layout_strategy = "center",
                layout_config = {
                    width = 0.5,
                    height = 0.4,
                },
                sorting_strategy = "ascending",
                previewer = false,
            },
            -- show hidden + ignored files (.env, .git, .claude, ...)
            pickers = {
                find_files = { hidden = true, no_ignore = true },
                live_grep = { additional_args = { "--hidden", "--no-ignore" } },
            },
        },
    },
}
