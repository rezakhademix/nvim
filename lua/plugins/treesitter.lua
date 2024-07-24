return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, {
                "tsx",
                "typescript",
                "bash",
                "comment",
                "css",
                "csv",
                "dockerfile",
                "go",
                "gomod",
                "gosum",
                "gotmpl",
                "html",
                "javascript",
                "json",
                "nginx",
                "php",
                "phpdoc",
                "proto",
                "vue",
                "xml",
                "yaml",
            })
        end,
    },
}
