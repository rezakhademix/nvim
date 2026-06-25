return {
    "mason-org/mason.nvim",
    opts = {
        -- go/typescript/docker/json/php/yaml/markdown tooling is provided by the
        -- LazyVim lang extras (see lazyvim.json). Only list tools not covered there.
        ensure_installed = {
            "stylua",
            "shellcheck",
            "shfmt",
            "bash-language-server",
            "checkmake",
            "css-lsp",
            "html-lsp",
            "htmlhint",
            "lua-language-server",
            "pyright",
            "misspell",
            "gotests", -- go.nvim test generation (not in go extra)
            "iferr",
            "vetur-vls", -- Vue (no vue extra enabled)
        },
    },
}
