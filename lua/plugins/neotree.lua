return {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
        filesystem = {
            -- show dotfiles and gitignored files (.env, .git, .claude, ...)
            filtered_items = {
                visible = true,
                hide_dotfiles = false,
                hide_gitignored = false,
                hide_hidden = false,
            },
        },
    },
}
