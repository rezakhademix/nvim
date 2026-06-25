return {
    {
        "ray-x/go.nvim",
        dependencies = {
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        ft = { "go", "gomod" },
        build = ':lua require("go.install").update_all_sync()',
        opts = {
            -- defer gopls + formatting to the LazyVim go extra (avoid double LSP/format)
            lsp_cfg = false,
            lsp_keymaps = false,
            lsp_inlay_hints = { enable = false },
        },
        config = function(_, opts)
            require("go").setup(opts)
        end,
    },
}
