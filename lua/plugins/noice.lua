return {
    {
        "folke/noice.nvim",
        opts = function(_, opts)
            opts.lsp.signature = {
                opts = { size = { max_height = 5 } },
            }
        end,
    },
}
