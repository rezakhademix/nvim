return {
    {
        "nvim-telescope/telescope.nvim",
        config = function()
            require("telescope").setup({
                pickers = {
                    find_files = {
                        theme = "dropdown",
                        previewer = false,
                        -- layout_config = {
                        --     width = 0.8, -- Width of the dropdown
                        --     height = 0.6, -- Height of the dropdown
                        -- },
                    },
                },
                extensions = {
                    -- Extensions configuration
                },
            })
            -- load Telescope extensions if needed
            -- require('telescope').load_extension('your_extension')
        end,
    },
}
