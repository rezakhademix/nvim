-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- Organize imports + format Go files on save.
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function(args)
        local bufnr = args.buf
        for _, client in pairs(vim.lsp.get_clients({ bufnr = bufnr })) do
            -- make_range_params now requires (window, position_encoding) on nvim 0.11+
            local params = vim.lsp.util.make_range_params(0, client.offset_encoding)
            params.context = { only = { "source.organizeImports" }, diagnostics = {} }
            local result = client:request_sync("textDocument/codeAction", params, 3000, bufnr)
            for _, r in pairs((result or {}).result or {}) do
                if r.edit then
                    vim.lsp.util.apply_workspace_edit(r.edit, client.offset_encoding)
                end
            end
        end
        vim.lsp.buf.format({ async = false })
    end,
})
