return {
    {
        "hrsh7th/nvim-cmp",
        version = false,
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
            "hrsh7th/cmp-nvim-lua",
        },
        opts = function()
            local cmp = require("cmp")
            local defaults = require("cmp.config.default")()
            local luasnip = require("luasnip")
            local auto_select = true

            local check_backspace = function()
                local col = vim.fn.col(".") - 1
                return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
            end

            return {
                auto_brackets = {}, -- add filetype for languages you want cmp add bracket automatically, e.g: "python"
                completion = {
                    completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
                },
                preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
                mapping = cmp.mapping.preset.insert({
                    ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
                    ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
                    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
                    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
                    ["<C-e>"] = cmp.mapping({
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close(),
                    }),
                    -- Accept currently selected item. If none selected, `select` first item.
                    -- Set `select` to `false` to only confirm explicitly selected items.
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expandable() then
                            luasnip.expand()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif check_backspace() then
                            fallback()
                        -- require("neotab").tabout()
                        else
                            fallback()
                            -- require("neotab").tabout()
                        end
                    end, {
                        "i",
                        "s",
                    }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, {
                        "i",
                        "s",
                    }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "path" },
                    { name = "luasnip" },
                    { name = "nvim_lua" },
                    { name = "calc" },
                }, {
                    { name = "buffer" },
                }),
                formatting = {
                    format = function(entry, item)
                        local icons = LazyVim.config.icons.kinds
                        if icons[item.kind] then
                            item.kind = icons[item.kind] .. item.kind
                        end

                        local widths = {
                            abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
                            menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
                        }

                        for key, width in pairs(widths) do
                            if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
                                item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
                            end
                        end

                        return item
                    end,
                },
                window = {
                    completion = {
                        col_offset = 0,
                        side_padding = 1,
                        winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
                        max_width = 50, -- New setting for width
                        max_height = 20, -- New setting for height
                    },
                },
                experimental = {
                    experimental = {
                        ghost_text = false,
                    },
                },
                sorting = defaults.sorting,
            }
        end,
        main = "lazyvim.util.cmp",
    },

    -- snippets
    {
        "nvim-cmp",
        dependencies = {
            {
                "garymjr/nvim-snippets",
                opts = {
                    friendly_snippets = true,
                },
                dependencies = { "rafamadriz/friendly-snippets" },
            },
        },
        opts = function(_, opts)
            opts.snippet = {
                expand = function(item)
                    return LazyVim.cmp.expand(item.body)
                end,
            }
            if LazyVim.has("nvim-snippets") then
                table.insert(opts.sources, { name = "snippets" })
            end
        end,
        keys = {
            {
                "<Tab>",
                function()
                    return vim.snippet.active({ direction = 1 }) and "<cmd>lua vim.snippet.jump(1)<cr>" or "<Tab>"
                end,
                expr = true,
                silent = true,
                mode = { "i", "s" },
            },
            {
                "<S-Tab>",
                function()
                    return vim.snippet.active({ direction = -1 }) and "<cmd>lua vim.snippet.jump(-1)<cr>" or "<S-Tab>"
                end,
                expr = true,
                silent = true,
                mode = { "i", "s" },
            },
        },
    },

    -- auto pairs
    {
        "echasnovski/mini.pairs",
        event = "VeryLazy",
        opts = {
            modes = { insert = true, command = true, terminal = false },
            -- skip autopair when next character is one of these
            skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
            -- skip autopair when the cursor is inside these treesitter nodes
            skip_ts = { "string" },
            -- skip autopair when next character is closing pair
            -- and there are more closing pairs than opening pairs
            skip_unbalanced = true,
            -- better deal with markdown code blocks
            markdown = true,
        },
        config = function(_, opts)
            LazyVim.mini.pairs(opts)
        end,
    },

    -- comments
    {
        "folke/ts-comments.nvim",
        event = "VeryLazy",
        opts = {},
    },

    -- Better text-objects
    {
        "echasnovski/mini.ai",
        event = "VeryLazy",
        opts = function()
            local ai = require("mini.ai")
            return {
                n_lines = 500,
                custom_textobjects = {
                    o = ai.gen_spec.treesitter({ -- code block
                        a = { "@block.outer", "@conditional.outer", "@loop.outer" },
                        i = { "@block.inner", "@conditional.inner", "@loop.inner" },
                    }),
                    f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
                    c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
                    t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
                    d = { "%f[%d]%d+" }, -- digits
                    e = { -- Word with case
                        {
                            "%u[%l%d]+%f[^%l%d]",
                            "%f[%S][%l%d]+%f[^%l%d]",
                            "%f[%P][%l%d]+%f[^%l%d]",
                            "^[%l%d]+%f[^%l%d]",
                        },
                        "^().*()$",
                    },
                    i = LazyVim.mini.ai_indent, -- indent
                    g = LazyVim.mini.ai_buffer, -- buffer
                    u = ai.gen_spec.function_call(), -- u for "Usage"
                    U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- without dot in function name
                },
            }
        end,
        config = function(_, opts)
            require("mini.ai").setup(opts)
            LazyVim.on_load("which-key.nvim", function()
                vim.schedule(function()
                    LazyVim.mini.ai_whichkey(opts)
                end)
            end)
        end,
    },

    {
        "folke/lazydev.nvim",
        ft = "lua",
        cmd = "LazyDev",
        opts = {
            library = {
                { path = "luvit-meta/library", words = { "vim%.uv" } },
                { path = "LazyVim", words = { "LazyVim" } },
                { path = "lazy.nvim", words = { "LazyVim" } },
            },
        },
    },
    -- Manage libuv types with lazy. Plugin will never be loaded
    { "Bilal2453/luvit-meta", lazy = true },
    -- Add lazydev source to cmp
    {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            table.insert(opts.sources, { name = "lazydev", group_index = 0 })
        end,
    },
}
