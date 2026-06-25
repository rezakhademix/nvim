return {
    "saghen/blink.cmp",
    opts = {
        keymap = {
            preset = "enter",
            ["<C-k>"] = { "select_prev", "fallback" },
            ["<C-j>"] = { "select_next", "fallback" },
            ["<C-b>"] = { "scroll_documentation_up", "fallback" },
            ["<C-f>"] = { "scroll_documentation_down", "fallback" },
            ["<C-e>"] = { "hide", "fallback" },
            ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
            ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        },
        completion = {
            -- keep <CR> as confirm-on-selected (no auto-insert on move)
            list = { selection = { preselect = true, auto_insert = false } },
            menu = {
                border = "rounded",
                draw = {
                    columns = {
                        { "label", "label_description", gap = 1 },
                        { "kind_icon", "kind", gap = 1 },
                    },
                },
            },
            documentation = {
                auto_show = true,
                window = { border = "rounded" },
            },
            -- no ghost text (matches old nvim-cmp behavior)
            ghost_text = { enabled = false },
        },
        sources = {
            -- lazydev source is auto-added by LazyVim's lazydev spec
            default = { "lsp", "path", "snippets", "buffer" },
        },
        -- signatures handled by lsp_signature.nvim instead (avoid double popups)
        signature = { enabled = false },
    },
}
